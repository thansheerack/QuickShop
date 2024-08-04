import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import 'package:quickshop/buttons/custom_button.dart';
import 'package:quickshop/pages/home/home_page.dart';
import 'package:quickshop/pages/user_info/user_information.dart';
import 'package:quickshop/provider/auth_provider.dart';
import 'package:quickshop/utils/utils.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.verificationId});

  final String verificationId;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(255, 175, 231, 142),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 330,
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 30, 102, 17),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    image: DecorationImage(
                      image: AssetImage('images/otp-illustrations.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Enter the OTP sent to your phone number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Pinput(
                  controller: otpController,
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black38,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CutomButton(
                    text: 'Verify',
                    onPressed: () {
                      if (otpCode != null) {
                        verifyOtp(context, otpCode!);
                      } else {
                        showSnackBar(context, 'Please enter the OTP');
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Didn\'t receive the OTP?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Resend OTP',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 30, 102, 17),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          ap.checkExistingUser().then((value) async {
            if (value == true) {
              //user existing in app
              ap.getDataFromFirestore().then((value) {
                ap.saveUserDataToSP().then((value) {
                  ap.setSignIn().then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => false);
                  });
                });
              });
            } else {
              //new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserInformation()),
                  (route) => false);
            }
          });
        });
  }
}
