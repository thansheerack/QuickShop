import 'package:flutter/material.dart';

class UserInfoTextfield extends StatefulWidget {
  const UserInfoTextfield({
    super.key,
    required this.hintText,
    required this.icon,
    required this.inputtype,
    required this.maxlines,
    required this.controller,
  });

  final String hintText;
  final IconData icon;
  final TextInputType inputtype;
  final int maxlines;
  final TextEditingController controller;

  @override
  State<UserInfoTextfield> createState() => _UserInfoTextfieldState();
}

class _UserInfoTextfieldState extends State<UserInfoTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color.fromARGB(255, 8, 27, 8),
      controller: widget.controller,
      keyboardType: widget.inputtype,
      maxLines: widget.maxlines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
