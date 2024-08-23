import 'package:bloc_template/bloc/language/language_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            context
                .read<LanguageBloc>()
                .add(const LanguageChanged(Locale("en")));
          },
          child: Text(AppLocalizations.of(context)!.hellow_world),
        ),
      ),
    );
  }
}
