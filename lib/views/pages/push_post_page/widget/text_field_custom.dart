import 'package:flutter/material.dart';
class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String  title;
  const TextFieldCustom({Key? key,required this.controller, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
          label:  Text(title),
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
          border: const OutlineInputBorder()),
    );
  }
}