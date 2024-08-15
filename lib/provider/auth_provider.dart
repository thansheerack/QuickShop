import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:quickshop/model/user_modeldb.dart';
import 'package:quickshop/pages/sign_in/otp_screen.dart';
import 'package:quickshop/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _userid;
  String get userid => _userid!;
  UserModeldb? _userModeldb;
  UserModeldb get userModeldb => _userModeldb!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  AuthProvider() {
    checkSignIn();
  }

  void checkSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool('isSignedIn') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool('isSignedIn', true);
    _isSignedIn = true;
    notifyListeners();
  }

//signin
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          showSnackBar(context, e.message.toString());
        },
        codeSent: (verificationId, forceREsendingToken) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OtpScreen(verificationId: verificationId)));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  //verifyotp
  void verifyOtp(
      {required BuildContext context,
      required String verificationId,
      required String userOtp,
      required Function onSuccess}) async {
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user!;
      _userid = user.uid;
      _isSignedIn = true;
      final SharedPreferences s = await SharedPreferences.getInstance();
      s.setBool('isSignedIn', true);
      onSuccess();
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  //Database operations
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection('users').doc(_userid).get();

    if (snapshot.exists) {
      print('User Exist');
      var userData = snapshot.data() as Map<String, dynamic>;
      return true;
    } else {
      print('New User');
      return false;
    }
  }

  void saveUserDataToFirebase(
      {required BuildContext context,
      required UserModeldb userModeldb,
      required File profilePic,
      required Function onSuccess}) async {
    _isLoading = true;
    notifyListeners();
    try {
      //uploading img to firebase storage
      await storeFileToStorage("profilePic/$_userid", profilePic).then((value) {
        userModeldb.profilePic = value;
        userModeldb.created_at =
            DateTime.now().millisecondsSinceEpoch.toString();
        userModeldb.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
        userModeldb.uid = _firebaseAuth.currentUser!.phoneNumber!;
      });
      _userModeldb = userModeldb;

      //uploading to db
      await _firebaseFirestore
          .collection('users')
          .doc(_userid)
          .set(userModeldb.toMap())
          .then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //existing user
  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModeldb = UserModeldb(
        uid: snapshot['uid'],
        name: snapshot['name'],
        email: snapshot['email'],
        phoneNumber: snapshot['phoneNumber'],
        created_at: snapshot['created_at'],
        profilePic: snapshot['profilePic'],
        // cart: snapshot['cart'],
      );
      _userid = userModeldb.uid;
    });
  }

  //storing data locally
  Future saveUserDataToSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModeldb.toMap()));
  }

  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    _userModeldb = UserModeldb.fromMap(jsonDecode(data));
    _userid = _userModeldb!.uid;
    notifyListeners();
  }

  //signout
  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    s.clear();
  }
}
