import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'passengerView/passengerView.dart';

class pasengerLoginPage extends StatefulWidget {
  const pasengerLoginPage({Key? key}) : super(key: key);
  @override
  _pasengerLoginPageState createState() => _pasengerLoginPageState();
}

class _pasengerLoginPageState extends State<pasengerLoginPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String receivedVerificationID = "";
  bool verifyNumber = false;
  bool otpVerified = false;
  bool showCursor = true;

  String countryCode = "+91";
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  decorativeWidget customWidget = decorativeWidget();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    decorativeWidget customWidget = decorativeWidget();
    List scaffoldBody = [
      verifyPhoneNumberContainer(customWidget, size, context),
      Container(
        width: size.width * 0.75,
        height: size.height * 0.5,
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.075,
            ),
            Container(
              alignment: Alignment.center,
              child:
                  customWidget.putTitleText("Enter OTP", size.width * 0.05, 2),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            OTPContainer(customWidget, size),
            SizedBox(
              height: size.height * 0.005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: customWidget.putLabelText(
                        "Back", size.width * 0.035, 1)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        otpController.clear();
                      });
                    },
                    child: customWidget.putLabelText(
                        "Clear", size.width * 0.035, 2)),
              ],
            ),
            SizedBox(
              height: size.height * 0.075,
            ),
            Container(
              width: size.width * 0.4,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [customWidget.getAppColor(), Colors.greenAccent],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(size.width * 0.05)),
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.05)),
                hoverColor: customWidget.getAppColor(),
                splashColor: Colors.greenAccent,
                onPressed: () {
                  setState(() {
                    verifyOTP(size);
                  });
                },
                child: Center(
                  child: customWidget.putTitleText(
                      "Verify", size.height * 0.02, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
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
            scaffoldBody[index],
          ])),
    );
  }

  Container verifyPhoneNumberContainer(
      decorativeWidget customWidget, Size size, BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.025,
            ),
            customWidget.putLabelText(
                "Enter Phone Number for Quick Login", size.width * 0.045, 2),
            SizedBox(
              height: size.height * 0.065,
            ),
            PhoneNumberContainer(customWidget, size),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.4,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [customWidget.getAppColor(), Colors.greenAccent],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
                borderRadius:
                    BorderRadius.all(Radius.circular(size.width * 0.05)),
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.05)),
                hoverColor: customWidget.getAppColor(),
                splashColor: Colors.greenAccent,
                onPressed: () {
                  setState(() {
                    verifyPhoneNumber();
                  });
                },
                child: Center(
                  child: customWidget.putTitleText(
                      "Send OTP", size.height * 0.02, 0),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => passengerView()));
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: size.width * 0.05),
                child: customWidget.putLabelText(
                    "Continue without login", size.height * 0.0225, 2),
              ),
            ),
          ],
        ));
  }

  Container PhoneNumberContainer(decorativeWidget customWidget, Size size) {
    return Container(
      width: size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.05),
        boxShadow: [
          BoxShadow(
              color: Color(0xffc0c0c0c0),
              blurRadius: size.width * 0.015,
              offset: Offset(0, 4))
        ],
        color: Colors.white,
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          countryCode = number.dialCode!;
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle:
            GoogleFonts.lexend(color: customWidget.getAppColor()),
        initialValue: number,
        textFieldController: phoneNumberController,
        formatInput: false,
        keyboardType: TextInputType.phone,
        inputBorder: OutlineInputBorder(),
        inputDecoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Phone Number',
          hintStyle: GoogleFonts.lexend(color: customWidget.getAppColor()),
        ),
        cursorColor: customWidget.getAppColor(),
      ),
    );
  }

  Container OTPContainer(decorativeWidget customWidget, Size size) {
    return Container(
      height: size.height * 0.075,
      width: size.width * 0.75,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.045,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.05),
        boxShadow: [
          BoxShadow(
              color: Color(0xffc0c0c0c0),
              blurRadius: size.width * 0.015,
              offset: Offset(0, 4))
        ],
        color: Colors.white,
      ),
      child: TextFormField(
          controller: otpController,
          autofocus: true,
          onChanged: (value) {
            setState(() {
              showCursor = otpController.text.length < 6 ? true : false;
            });
          },
          showCursor: showCursor,
          cursorColor: customWidget.getAppColor(),
          readOnly: false,
          style: GoogleFonts.lexend(
              textStyle: TextStyle(
                  letterSpacing: size.width * 0.08,
                  fontWeight: FontWeight.w600,
                  fontSize: size.width * 0.05)),
          keyboardType: TextInputType.phone,
          maxLength: 6,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counter: Offstage(),
          )),
    );
  }

  void verifyOTP(Size size) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedVerificationID, smsCode: otpController.text);
    await auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          otpVerified = true;
        });
        Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: customWidget.getAppColor(),
          textColor: Colors.white,
          fontSize: size.width * 0.045,
        );
      },
    ).whenComplete(
      () {
        if (otpVerified) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => passengerView(),
            ),
          );
        }
      },
    );
  }

  void verifyPhoneNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: countryCode + phoneNumberController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {});
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          setState(() {
            receivedVerificationID = verificationID;
            index = 1;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }
}

//import 'package:flutter/material.dart';
// import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';
//
// import '../passengerView.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     decorativeWidget customWidget = decorativeWidget();
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//           padding: EdgeInsets.only(bottom: 20),
//           color: Colors.white,
//           child: Column(children: <Widget>[
//             Container(
//                 height: MediaQuery.of(context).size.height * 0.42,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                       customWidget.getAppColor(),
//                       Colors.greenAccent
//                     ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
//                     borderRadius:
//                         BorderRadius.only(bottomLeft: Radius.circular(90))),
//                 child: Center(child: Image.asset("assets/Bus Stop-pana.png"))),
//             Expanded(
//               child: Container(
//                   margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
//                   child: Column(
//                     children: <Widget>[
//                       _textInput(
//                         hint: "Email",
//                         icon: Icons.email,
//                       ),
//                       _textInput(hint: "Password", icon: Icons.vpn_key),
//                       Container(
//                           alignment: Alignment.centerRight,
//                           margin: const EdgeInsets.only(top: 10, bottom: 10),
//                           child: customWidget.putLabelText(
//                               "Forgot Password ?", size.height * 0.018, 1)),
//                       Expanded(
//                         child: Center(
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => passengerView()));
//                             },
//                             child: Container(
//                                 width: double.infinity,
//                                 margin: EdgeInsets.only(left: 10),
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.05,
//                                 decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         customWidget.getAppColor(),
//                                         Colors.greenAccent
//                                       ],
//                                       end: Alignment.bottomCenter,
//                                       begin: Alignment.topCenter,
//                                     ),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(60))),
//                                 child: Center(
//                                     child: customWidget.putTitleText(
//                                         "LOGIN", size.height * 0.023, 0))),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => passengerView()));
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: customWidget.putLabelText(
//                               "Continue without login", size.height * 0.019, 2),
//                         ),
//                       ),
//                       Expanded(
//                         child: Align(
//                           alignment: FractionalOffset.bottomCenter,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               customWidget.putLabelText(
//                                   "Don't Have an account ? ",
//                                   size.height * 0.018,
//                                   1),
//                               GestureDetector(
//                                   onTap: null,
//                                   child: customWidget.putLabelText(
//                                       "Register", size.height * 0.019, 2))
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//             ),
//           ])),
//     );
//   }
//
//   Widget _textInput({controller, hint, icon}) {
//     return Container(
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//         color: Colors.white,
//       ),
//       margin: EdgeInsets.only(left: 10, bottom: 20),
//       child: Material(
//         borderRadius: BorderRadius.all(Radius.circular(6)),
//         elevation: 4.0,
//         shadowColor: Colors.grey,
//         child: TextFormField(
//           cursorColor: Colors.green,
//           controller: controller,
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: hint,
//             prefixIcon: Icon(
//               icon,
//               color: Colors.green,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
