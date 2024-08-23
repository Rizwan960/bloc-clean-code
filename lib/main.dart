import 'package:bloc_template/bloc/language/language_bloc.dart';
import 'package:bloc_template/configs/model/user/user_model.dart';
import 'package:bloc_template/configs/repository/auth/login_http_service.dart';
import 'package:bloc_template/configs/repository/auth/login_repository.dart';
import 'package:bloc_template/configs/routes/routes.dart';
import 'package:bloc_template/configs/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (context) => LanguageBloc(),
        )
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            debugShowCheckedModeBanner: false,
            title: 'Template',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English locale
              Locale('es'), // Spanish locale
            ],
            onGenerateRoute: Routes.generateRoutes,
            initialRoute: RoutesNames.splashScreen,
          );
        },
      ),
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<AuthApiRepository>(() => AuthHttpApiRepository());
  getIt.registerSingleton<UserModel>(UserModel(token: '', error: ''));
}
