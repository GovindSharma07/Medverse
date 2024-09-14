import 'dart:ui';

import 'package:flutter/material.dart';

class BoardingBg extends StatelessWidget {
  final Widget child;
  const BoardingBg(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/boarding.jpg"),
                fit: BoxFit.fill)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.white10]),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 2, color: Colors.white30)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        border: Border.all(
                          color: Colors.white,
                        ),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.contain)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  child
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
