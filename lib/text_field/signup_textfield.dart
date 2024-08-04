import 'package:country_picker/country_picker.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickshop/buttons/custom_button.dart';
import 'package:quickshop/provider/auth_provider.dart';

class SignupTextfield extends StatefulWidget {
  const SignupTextfield({super.key});

  @override
  State<SignupTextfield> createState() => _SignupTextfieldState();
}

class _SignupTextfieldState extends State<SignupTextfield> {
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
    return Center(
      child: Column(
        children: [
          TextFormField(
            cursorColor: const Color.fromARGB(255, 25, 62, 17),
            controller: phoneController,
            onChanged: (value) {
              setState(() {
                phoneController.text = value;
              });
            },
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: 'Enter phone number',
              helperStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w100,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              prefixIcon: Container(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      countryListTheme: const CountryListThemeData(
                        bottomSheetHeight: 450,
                      ),
                      onSelect: (value) {
                        setState(() {
                          selectedCountry = value;
                        });
                      },
                    );
                  },
                  child: Text(
                    '${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              suffixIcon: phoneController.text.length >= 9
                  ? Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: CutomButton(
              text: 'Login',
              onPressed: () {
                sendPhoneNumber();
              },
            ),
          ),
        ],
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(
        context, '+${selectedCountry.phoneCode}${phoneController.text}');
  }
}
