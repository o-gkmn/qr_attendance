import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCameraScreen extends StatelessWidget {
  const QRCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      builder: (context, controller) {
        return Column(
          children: [_CustomDivider(), _TextsField(), _QRCamera()],
        );
      },
    );
  }
}

class _QRCamera extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QRCameraState();
  }
}

class _QRCameraState extends State<_QRCamera> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? qrController;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    qrController = controller;
    qrController!.resumeCamera();
    qrController!.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: (MediaQuery.of(context).size.width < 400 ||
                    MediaQuery.of(context).size.height < 400)
                ? 350.0
                : 700.0),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 5,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey),
    );
  }
}

class _TextsField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          color: Theme.of(context).scaffoldBackgroundColor),
      child: Expanded(
        child: Column(
          children: [
            Text(
              "QR Kodu Okutun",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.black, fontSize: 16),
            ),
            const Spacer(flex: 1),
            Text(
              "Qr kodunu belirlenen alana ortalayacak şekilde hizalayın",
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
