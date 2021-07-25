import 'package:flutter/material.dart';
import 'package:taxiappdemo/blocs/loginbloc.dart';
import 'package:taxiappdemo/screen/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
      new LogInBloc(),
      MaterialApp(
        home: LoginScreen(),
      )));
}

class MyApp extends InheritedWidget {
  final LogInBloc logInBloc;
  final Widget child;

  const MyApp(this.logInBloc, this.child) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }

  static MyApp of(BuildContext context) {
    final MyApp? myApp = context.dependOnInheritedWidgetOfExactType<MyApp>();
    assert(myApp != null, 'No FrogColor found in context');
    return myApp!;

    //return context.dependOnInheritedWidgetOfExactType<MyApp>()!;
  }
}
