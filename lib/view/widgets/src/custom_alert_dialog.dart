import 'package:flutter/material.dart';
import 'package:qr_attendance/view/animations/src/shake_animations.dart';

class CustomAlertDialog extends StatefulWidget {
  final String alertText;
  const CustomAlertDialog({super.key, required this.alertText});

  @override
  State<StatefulWidget> createState() {
    return _CustomAlertDialogState();
  }
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final key = GlobalKey<_CustomAlertDialogState>();
  @override
  Widget build(BuildContext context) {
    return Shake(
      deltaX: 40,
      duration: const Duration(milliseconds: 1000),
      child: Center(
          child: Container(
        padding: const EdgeInsets.only(left: 50, right: 50),
        height: 180,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 1),
            Icon(
              Icons.warning,
              size: 48.0,
              color: Theme.of(context).colorScheme.error,
            ),
            const Spacer(flex: 1),
            Text(widget.alertText, style: Theme.of(context).textTheme.titleSmall,),
            const Spacer(flex: 1),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Kapat")),
            const Spacer(flex: 1),
          ],
        ),
      )),
    );
  }
}
