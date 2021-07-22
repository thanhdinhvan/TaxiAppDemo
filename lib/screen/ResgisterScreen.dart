import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {

@override
  _RegisterBodyState createState() => _RegisterBodyState();

}

class _RegisterBodyState extends State<RegisterScreen> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(elevation: 0,
    backgroundColor: Colors.white
    ,iconTheme: IconThemeData(color: Colors.blue, size: 15),),
    body: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Image.asset('crossover.png'),
                ),
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                      child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                              labelText: "User Name",
                              labelStyle: TextStyle(
                                  color: Color(0xff888888), fontSize: 15))),
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                  labelText: "PASWWORD",
                                  labelStyle: TextStyle(
                                      color: Color(0xff888888), fontSize: 15)),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                          
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                      child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                              labelText: " Điền lại pass word",
                              labelStyle: TextStyle(
                                  color: Color(0xff888888), fontSize: 15))),
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                      child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                              labelText: "Gmail",
                              labelStyle: TextStyle(
                                  color: Color(0xff888888), fontSize: 15))),
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
                    padding: EdgeInsets.fromLTRB(0, 55, 0, 0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 18),),
                      onPressed: () {
                        print("object");
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(6))),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),);
  }
}
