import 'package:firebase_login/Repositories/user_repositories.dart';
import 'package:firebase_login/blocs/Authentication/authentication_bloc.dart';
import 'package:firebase_login/blocs/Authentication/authentication_events.dart';
import 'package:firebase_login/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/Authentication/authentication_state.dart';
import 'blocs/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: _userRepository),
      child: MaterialApp(
        home: BlocBuilder(
          builder: (context, state) {
            if(state is Uninitialized) {
              return SplashScreen();
            }
            return Container();
          }
        ),
      )

    );
  }

}
