import 'package:flutter/material.dart';

class ConfirmationButton extends StatefulWidget {
  ConfirmationButton({this.onPressed, this.text});
  final Function onPressed;
  final String text;
  @override
  _ConfirmationButtonState createState() => _ConfirmationButtonState();
}

class _ConfirmationButtonState extends State<ConfirmationButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 40,
      ),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Cairo',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
