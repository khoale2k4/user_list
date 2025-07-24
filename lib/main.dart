import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/blocs/theme/theme_bloc.dart';
import 'package:user_list/blocs/theme/theme_state.dart';
import 'package:user_list/global_provider.dart';
import 'package:user_list/layout_test.dart';
import 'package:user_list/models/theme_model.dart';
import 'package:user_list/routes/app_router.dart';
import 'package:user_list/themes/theme.dart';

final _appRouter = AppRouter();

void main() {
  runApp(
    // MaterialApp(
    //   theme: getTheme(),
    //   darkTheme: getDarkTheme(),
    //   home: TestLayout(),
    // ),
    // HelloWorld()
    MultiBlocProvider(
      providers: getGlobalBlocs(),
      child: const MainApp(),
    ),
  );
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: const Text(
            "Hello world!",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp.router(
          themeMode: themeState.theme == ThemeModel.light
              ? ThemeMode.light
              : themeState.theme == ThemeModel.dark
                  ? ThemeMode.dark
                  : ThemeMode.system,
          theme: getTheme(),
          darkTheme: getDarkTheme(),
          routerConfig: _appRouter.config(),
        );
      },
    );
  }
}
