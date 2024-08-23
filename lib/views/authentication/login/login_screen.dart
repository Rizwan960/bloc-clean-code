import 'package:bloc_template/bloc/login/login_bloc.dart';
import 'package:bloc_template/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget representing the login screen of the application.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// The state of the [LoginScreen] widget.
class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBlocs;

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBlocs = LoginBloc(authApiRepository: getIt());
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _loginBlocs.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _loginBlocs,
        child: Form(
          key: _formKey,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Widget for submit button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
