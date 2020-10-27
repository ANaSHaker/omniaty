
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FloatingButton extends StatefulWidget {
  final String buttonText;
  final Function onPressed;
  FloatingButton({@required this.buttonText, @required this.onPressed});
  @override
  _FloatingButtonState createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      margin: const EdgeInsets.only(bottom: 10),
      height: kFloatingActionButtonMargin * 3,
      child: RaisedButton(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: widget.onPressed,
          child: Text(
            widget.buttonText,
            style: TextStyle( fontSize: 18),
          )),
    );
  }
}