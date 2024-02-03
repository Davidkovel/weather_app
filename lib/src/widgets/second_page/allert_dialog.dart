import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

import 'time_picker.dart';
// import 'package:google_fonts/google_fonts.dart';


class AllertDialogPage extends StatefulWidget {
  const AllertDialogPage({super.key});

  @override
  State<AllertDialogPage> createState() => _AllertDialogPageState();
}

class _AllertDialogPageState extends State<AllertDialogPage> {
  void showAlert() {
    CoolAlert.show(
      context: context,
      type: CoolAlertType.warning,
      text: 'You just broke protocol',
      onConfirmBtnTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final warningAlert = _buildButton(
      onTap: () {
        showAlert();
      },
      text: 'Warning',
      color: Colors.orange,
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            warningAlert,
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    VoidCallback? onTap,
    required String text,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: MaterialButton(
        color: color,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
