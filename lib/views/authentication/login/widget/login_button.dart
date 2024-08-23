import 'package:bloc_template/bloc/login/login_bloc.dart';
import 'package:bloc_template/configs/extention/enums.dart';
import 'package:bloc_template/configs/extention/flushbar_extention.dart';
import 'package:bloc_template/configs/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          context.flushBarErrorMessage(message: state.message.toString());
        }

        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesNames.mainHomeViewScreen, (route) => false);
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
          buildWhen: (current, previous) =>
              current.postApiStatus != previous.postApiStatus,
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    context.read<LoginBloc>().add(const LoginButton());
                  }
                },
                child: state.postApiStatus == PostApiStatus.loading
                    ? const CircularProgressIndicator()
                    : const Text('Login'));
          }),
    );
  }
}
