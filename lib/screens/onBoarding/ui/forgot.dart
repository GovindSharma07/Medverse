import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medverse/component/boarding_bg.dart';
import 'package:medverse/component/input.dart';

class Forgot extends StatelessWidget {
  Forgot({super.key});

  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BoardingBg(Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Forgot Password?\nDon't  worry, we got you",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          InputBox(
              controller: _email,
              obs: false,
              label: "Email Address",
              iconData: Icons.mail_lock_outlined),
          ElevatedButton(
              onPressed: () async {
                String? res = await sendEmail(_email.text);
                if (res == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email sent successfully')));
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error sending email')));
                }
              },
              child: const Text('Send Email')),
        ],
      )),
    );
  }

  Future<String?> sendEmail(String? email) async {
    try {
      if (email == null) {
        return "Kindly  enter your email address";
      } else {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        return null;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
