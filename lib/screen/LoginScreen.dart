import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxiappdemo/blocs/loginBloc.dart';
import 'package:taxiappdemo/dilog/LoadingDialog.dart';
import 'package:taxiappdemo/dilog/MsgDiaLog.dart';
import 'package:taxiappdemo/screen/ResgisterScreen.dart';
import 'package:taxiappdemo/screen/homePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var _nameController = new TextEditingController();
  var _passController = new TextEditingController();

  bool _showPass = false;

  LogInBloc logInBloc = new LogInBloc();

  @override
  void initState() {
    //SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = Size(double.infinity, 50);
    var boxConstraints = BoxConstraints.loose(size);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Image.asset('crossover.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'Login to continue using iCab',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                      child: StreamBuilder(
                          stream: logInBloc.nameStream,
                          builder: (context, snapshot) {
                            return TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                    errorText: snapshot.hasError
                                        ? snapshot.error.toString()
                                        : null,
                                    contentPadding: EdgeInsets.all(10.0),
                                    labelText: "User Name",
                                    labelStyle: TextStyle(
                                        color: Color(0xff888888),
                                        fontSize: 15)));
                          }),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Color(0xff888888), spreadRadius: 0.5),
                      ],
                    ),
                    height: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          StreamBuilder(
                              stream: logInBloc.passStream,
                              builder: (context, snapshot) {
                                return TextField(
                                    controller: _passController,
                                    obscureText: !_showPass,
                                    decoration: InputDecoration(
                                        errorText: snapshot.hasError
                                            ? snapshot.error.toString()
                                            : null,
                                        contentPadding: EdgeInsets.all(10.0),
                                        labelText: "PASWWORD",
                                        labelStyle: TextStyle(
                                            color: Color(0xff888888),
                                            fontSize: 15)),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black));
                              }),
                          GestureDetector(
                            onTap: onToggleShowPass,
                            child: Text(
                              _showPass ? "HiDe" : "Show",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Color(0xff888888), spreadRadius: 0.5),
                      ],
                    ),
                    height: 50,
                  ),
                ),
                Container(
                  constraints: boxConstraints,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                  child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        child: Text(
                          "Log in",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          _loginAction(context);
                        },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: RichText(
                    text: TextSpan(
                        text: "New user?",
                        style: TextStyle(color: Colors.black26, fontSize: 16),
                        children: [
                          TextSpan(
                              text: "   Sign up for a new acccount",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                })
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginAction(BuildContext context) {
    if (logInBloc.isValid(_nameController.text, _passController.text)) {
      LoadingDialog.showLoadingDialog(context, "Loading....");
      logInBloc.onSignIn(
          _nameController.text,
          _passController.text,
          () => {
                LoadingDialog.hideLoadingDiaLog(context),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()))
              },
          (err) => {
                LoadingDialog.hideLoadingDiaLog(context),
                MSgDiaLog.showMSGDiaLog(context, "Login fail", err)
              });
    }
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
