import 'package:flutter/material.dart';
import 'package:quickshop/pages/sign_in/sign_in.dart';
import 'package:quickshop/text_field/signup_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 175, 231, 142),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/signup.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                textAlign: TextAlign.center,
                'Create an account to continue.\nGet your favourite items at your doorstep.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black38,
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(
                width: 380,
                child: SizedBox(
                  height: 130,
                  child: SignupTextfield(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black38,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignIn()));
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 30, 102, 17),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
