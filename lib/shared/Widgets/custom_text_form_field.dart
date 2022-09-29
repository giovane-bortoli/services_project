import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? label;
  final String? hint;
  final String? helperText;
  final Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              label: label,
            ),
          ),
        ],
      ),
    );
  }
}
