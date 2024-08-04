import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:quickshop/buttons/custom_button.dart';
import 'package:quickshop/model/user_modeldb.dart';
import 'package:quickshop/pages/home/bottomnavbar/home_bottomnavbar.dart';
import 'package:quickshop/provider/auth_provider.dart';
import 'package:quickshop/text_field/user_info_textfield.dart';
import 'package:quickshop/utils/utils.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  //for image picker

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    selectImage();
                  },
                  child: image == null
                      ? const Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 50,
                            child: Icon(
                              Icons.account_circle,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(image!),
                        ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 175, 231, 142),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 80),
                      child: Column(
                        children: [
                          UserInfoTextfield(
                            hintText: 'Jhon Smith',
                            icon: Icons.account_circle,
                            inputtype: TextInputType.name,
                            maxlines: 1,
                            controller: nameController,
                          ),
                          const SizedBox(height: 20),
                          UserInfoTextfield(
                            hintText: 'abc@example.com',
                            icon: Icons.email,
                            inputtype: TextInputType.emailAddress,
                            maxlines: 1,
                            controller: emailController,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: CutomButton(
                              text: 'Continue',
                              onPressed: () {
                                storeData();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //store user data to db
  void storeData() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModeldb userModeldb = UserModeldb(
      uid: "",
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phoneNumber: "",
      created_at: "",
      profilePic: "",
      //cart: [],
    );

    ap.saveUserDataToFirebase(
        context: context,
        userModeldb: userModeldb,
        profilePic: image!,
        onSuccess: () {
          //store locally
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeBottomnavbar(),
                          ),
                          (route) => false),
                    ),
              );
        });
  }
}
