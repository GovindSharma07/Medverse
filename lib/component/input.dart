import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final TextEditingController controller;
  final bool obs;
  final String label;
  final IconData iconData;
  const InputBox(
      {super.key,
      required this.controller,
      required this.obs,
      required this.label,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obs,
      obscuringCharacter: "*",
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabled: true,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          fillColor: Colors.white,
          prefixIcon: Icon(
            iconData,
            color: Colors.white,
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.white, width: 2)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.white, width: 2))),
    );
  }
}
