import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medverse/component/input.dart';
import 'package:medverse/screens/home/ui/home.dart';
import 'package:medverse/screens/onBoarding/bloc/login_bloc.dart';
import 'package:medverse/component/boarding_bg.dart';
import 'package:medverse/screens/onBoarding/ui/forgot.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final LoginBloc _loginBloc;
  late final FirebaseAuth _mAuth;

  bool isLoginPage = true;

  @override
  void initState() {
    _loginBloc = LoginBloc();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _mAuth = FirebaseAuth.instance;
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.close();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
        bloc: _loginBloc,
        listenWhen: (previous, current) {
          if (current is LoginActionState) {
            return true;
          } else {
            return false;
          }
        },
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Home()));
          }
        },
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return const Scaffold(
              body: Center(child: Text("Loading...")),
            );
          } else {
            return BoardingBg(Column(
              children: [
                const Text("Welcome To Medverse",
                    style: TextStyle(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold)),
                const Text(
                  "We're so happy to have you with us",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                (state is LoginErrorState)
                    ? Text(
                        state.error,
                        style: const TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                const SizedBox(height: 20),
                InputBox(
                  controller: _emailController,
                  label: "Email Address",
                  iconData: Icons.email,
                  obs: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputBox(
                    controller: _passwordController,
                    obs: true,
                    label: "Password",
                    iconData: Icons.key),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_emailController.text.isEmpty) {
                        _loginBloc.add(LoginButtonErrorEvent(
                            "Please fill the Email id !!!"));
                      } else if (_passwordController.text.isEmpty) {
                        _loginBloc.add(LoginButtonErrorEvent(
                            "Please fill the Password !!!"));
                      } else {
                        (isLoginPage)
                            ? _loginBloc.add(SignInLoginEvent(
                                email: _emailController.text.toString(),
                                password: _passwordController.text.toString(),
                                mAuth: _mAuth))
                            : _loginBloc.add(SignUpLoginEvent(
                                email: _emailController.text.toString(),
                                password: _passwordController.text.toString(),
                                mAuth: _mAuth));
                      }
                    },
                    child: Text(
                      (isLoginPage) ? "Login" : "Register",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 2,
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isLoginPage = !isLoginPage;
                          });
                        },
                        child: Text((isLoginPage) ? "Register" : "Login")),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  Forgot()));
                        },
                        child: const Text("Forgot Password?")),
                  ],
                )
              ],
            ));
          }
        });
  }
}
