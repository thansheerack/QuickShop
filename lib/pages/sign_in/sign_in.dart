import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:quickshop/pages/sign_in/sign_up/sign_up.dart';
import 'package:quickshop/text_field/signup_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: '971',
    name: 'United Arab Emirates',
    countryCode: 'AE',
    e164Sc: 0,
    geographic: true,
    level: 1,
    example: 'United Arab Emirates',
    displayName: 'United Arab Emirates',
    displayNameNoCountryCode: 'United Arab Emirates',
    e164Key: '',
  );

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
                'Welcome Back',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                textAlign: TextAlign.center,
                'We missed you.\nSign in to continue shopping',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black38,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                width: 380,
                child: SignupTextfield(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black38,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
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
