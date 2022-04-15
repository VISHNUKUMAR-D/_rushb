import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../passenger/views/passengerView.dart';

class loginView extends GetView<LoginController> {
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
                        "PICK YOUR BUS !", size.width * 0.075, 0),
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(const Radius.circular(20)),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new passengerView()));
                          },
                          child: Center(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/Person-Image2.jpg"),
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth),
                                ),
                                customWidget.putTitleText(
                                    "PASSENGER", size.width * 0.03, 1)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: size.height * 0.15,
                        height: size.height * 0.15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.125,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Image(
                                        image: const AssetImage(
                                            "assets/Conductor-Image2.jpg"),
                                        width: size.height * 0.08,
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                                customWidget.putTitleText(
                                    "CONDUCTOR", size.width * 0.03, 1)
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
