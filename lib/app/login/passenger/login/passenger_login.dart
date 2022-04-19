import 'package:flutter/material.dart';
import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';

import '../passengerView.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    decorativeWidget customWidget = decorativeWidget();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.only(bottom: 20),
          color: Colors.white,
          child: Column(children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.42,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      customWidget.getAppColor(),
                      Colors.greenAccent
                    ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90))),
                child: Center(child: Image.asset("assets/Bus Stop-pana.png"))),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: <Widget>[
                      _textInput(hint: "Email", icon: Icons.email),
                      _textInput(hint: "Password", icon: Icons.vpn_key),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: customWidget.putLabelText(
                              "Forgot Password ?", size.height * 0.018, 1)),
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => passengerView()));
                            },
                            child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 10),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        customWidget.getAppColor(),
                                        Colors.greenAccent
                                      ],
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60))),
                                child: Center(
                                    child: customWidget.putTitleText(
                                        "LOGIN", size.height * 0.023, 0))),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => passengerView()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: customWidget.putLabelText(
                              "Continue without login", size.height * 0.019, 2),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customWidget.putLabelText(
                                  "Don't Have an account ? ",
                                  size.height * 0.018,
                                  1),
                              GestureDetector(
                                  onTap: null,
                                  child: customWidget.putLabelText(
                                      "Register", size.height * 0.019, 2))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ])),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(left: 10, bottom: 20),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        elevation: 4.0,
        shadowColor: Colors.grey,
        child: TextFormField(
          cursorColor: Colors.green,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
