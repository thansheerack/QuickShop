import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:quickshop/buttons/custom_button.dart';

class PhnNumberForm extends StatefulWidget {
  const PhnNumberForm({super.key});

  @override
  _PhnNumberFormState createState() => _PhnNumberFormState();
}

class _PhnNumberFormState extends State<PhnNumberForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'AE';
  PhoneNumber _phoneNumber = PhoneNumber(isoCode: 'AE');

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                _phoneNumber = number;
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: _phoneNumber,
              textFieldController: controller,
              formatInput: true,
              keyboardType:
                  const TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
            CutomButton(
              text: 'Continue',
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  // Form is valid, perform your actions here
                  print('Form is valid');
                  print('Phone number: ${_phoneNumber.phoneNumber}');
                  print('ISO code: ${_phoneNumber.isoCode}');
                } else {
                  // Form is invalid
                  print('Form is invalid');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
