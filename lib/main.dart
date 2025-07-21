import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/global_provider.dart';
import 'package:user_list/blocs/users/user_bloc.dart';
import 'package:user_list/routes/app_router.dart';

void main() {
  runApp(
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
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
