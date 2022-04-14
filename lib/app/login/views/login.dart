import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/login_controller.dart';

class loginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Offset distance = const Offset(5, 5);
    double blur = 15.0;
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
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.height * 0.04),
                    topRight: Radius.circular(size.height * 0.04)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.05),
                    child: Text(
                      "PICK YOUR BUS !",
                      style: GoogleFonts.lexend(
                        fontSize: size.width * 0.075,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Image(
                                      image: AssetImage(
                                          "assets/Person-Image2.jpg"),
                                      width: double.infinity,
                                      fit: BoxFit.fitWidth),
                                ),
                                Text("Passenger")
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                        image: AssetImage(
                                            "assets/Conductor-Image2.jpg"),
                                        width: size.height * 0.08,
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                                Text("Conductor")
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
