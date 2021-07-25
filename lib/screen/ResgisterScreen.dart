import 'package:flutter/material.dart';
import 'package:taxiappdemo/blocs/registerbloc.dart';
import 'package:taxiappdemo/dilog/LoadingDialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taxiappdemo/dilog/MsgDiaLog.dart';
import 'package:taxiappdemo/screen/homePage.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterScreen> {
  //blocs
  RegisterBloc registerBloc = new RegisterBloc();
  // controller
  var _emailController = TextEditingController();
  var _passController = TextEditingController();
  var _phoneController = TextEditingController();
  var _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    registerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue, size: 15),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('crossover.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Điền đầy đủ thông tin để đăng ký',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Register to continue using iCab',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Container(
                  child: StreamBuilder(
                      stream: registerBloc.nameStream,
                      builder: (context, snapshot) => TextField(
                            controller: _nameController,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                                errorText: snapshot.hasError
                                    ? snapshot.error.toString()
                                    : null,
                                labelText: "Name",
                                prefixIcon: Container(
                                    width: 50, child: Image.asset("user.jpg")),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffCED0D2), width: 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                          )),
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
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      StreamBuilder(
                          stream: registerBloc.passStream,
                          builder: (context, snapshot) {
                            return TextField(
                              controller: _passController,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              decoration: InputDecoration(
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  labelText: "Pass",
                                  prefixIcon: Container(
                                      width: 50,
                                      child: Image.asset("lock.png")),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffCED0D2), width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6)))),
                            );
                          }),
                    ],
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
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  child: StreamBuilder(
                      stream: registerBloc.phoneStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _phoneController,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          decoration: InputDecoration(
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelText: "Phone",
                              prefixIcon: Container(
                                  width: 50, child: Image.asset("phone.png")),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffCED0D2), width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)))),
                        );
                      }),
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
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  child: StreamBuilder(
                      stream: registerBloc.emailStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _emailController,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                          decoration: InputDecoration(
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelText: "Email",
                              prefixIcon: Container(
                                  width: 50, child: Image.asset("mail.png")),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffCED0D2), width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)))),
                        );
                      }),
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
                padding: EdgeInsets.fromLTRB(0, 55, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      _signUpClick(context);
                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUpClick(BuildContext context) {
    if (registerBloc.isValid(
      _nameController.text,
      _passController.text,
      _phoneController.text,
      _emailController.text,
    )) {
      LoadingDialog.showLoadingDialog(context, "Loading.....");
      registerBloc.singUp(
          _nameController.text,
          _passController.text,
          _emailController.text,
          _phoneController.text,
          () => {
                LoadingDialog.hideLoadingDiaLog(context),
                Navigator.pop(context)
              },
          (var err) => {
                LoadingDialog.hideLoadingDiaLog(context),
                MSgDiaLog.showMSGDiaLog(context, "Đã xảy ra lỗi", err)
              });
    }
  }
}
