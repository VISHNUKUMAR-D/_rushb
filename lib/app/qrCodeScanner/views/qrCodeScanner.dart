import 'dart:io';

import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class qrCodeScanner extends StatefulWidget {
  const qrCodeScanner({Key? key}) : super(key: key);

  @override
  _qrCodeScannerState createState() => _qrCodeScannerState();
}

class _qrCodeScannerState extends State<qrCodeScanner> {
  decorativeWidget customWidget = decorativeWidget();
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customWidget.getAppColor(),
        foregroundColor: Colors.white,
        title: customWidget.putTitleText(
            "Scan to get Ticket", size.height * 0.025, 0),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQRView(context),
          Positioned(
              bottom: size.height * 0.175,
              child: IconButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                icon: FutureBuilder<bool?>(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Icon(
                        snapshot.data!
                            ? Icons.flash_on_sharp
                            : Icons.flash_off_sharp,
                        color: Colors.white,
                        size: size.width * 0.075,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              )),
          Positioned(
              bottom: size.height * 0.1,
              child: Container(
                padding: EdgeInsets.all(size.width * 0.025),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width * 0.015),
                    color: Colors.white24),
                child: customWidget.putTitleText(
                    "Message", size.height * 0.015, 1),
              )),
        ],
      ),
    );
  }

  buildQRView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderLength: MediaQuery.of(context).size.width * 0.06,
            borderWidth: MediaQuery.of(context).size.width * 0.02,
            borderColor: customWidget.getAppColor(),
            borderRadius: MediaQuery.of(context).size.width * 0.01,
            cutOutSize: MediaQuery.of(context).size.width * 0.75),
      );

  onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
  }
}
