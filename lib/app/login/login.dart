import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';
import 'package:_rushb/app/login/passenger/login/passenger_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class loginView extends StatefulWidget {
  const loginView({Key? key}) : super(key: key);

  @override
  _loginViewState createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  decorativeWidget customWidget = decorativeWidget();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            height: size.height * 0.40,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.16),
              child: const Image(
                  image: AssetImage("assets/Bus Stop-pana.png"),
                  width: double.infinity,
                  fit: BoxFit.fitWidth),
            ),
          ),
          Expanded(
            child: Container(
              height: size.height * 0.60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: customWidget.getAppColor(),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.height * 0.04),
                    topRight: Radius.circular(size.height * 0.04)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.05),
                    child: customWidget.putTitleText(
                        "PICK YOUR BUS !", size.width * 0.06, 0),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: size.height * 0.15,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.width * 0.05)),
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.05)),
                          hoverColor: customWidget.getAppColor(),
                          elevation: 0,
                          splashColor: Colors.greenAccent,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new LoginPage()));
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Image(
                                      image: const AssetImage(
                                          "assets/Passenger.png"),
                                      width: size.height * 0.08,
                                      fit: BoxFit.fitWidth),
                                ),
                                customWidget.putTitleText(
                                    "Passenger", size.width * 0.03, 1)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: size.height * 0.15,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(size.width * 0.05)),
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.05)),
                          hoverColor: customWidget.getAppColor(),
                          elevation: 0,
                          splashColor: Colors.greenAccent,
                          onPressed: () {},
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Image(
                                      image: const AssetImage(
                                          "assets/Conductor.png"),
                                      width: size.height * 0.06,
                                      fit: BoxFit.fitWidth),
                                ),
                                customWidget.putTitleText(
                                    "Conductor", size.width * 0.03, 1)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
