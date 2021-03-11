import 'package:flutter/material.dart';

class YellowButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const YellowButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.only(top: 14, bottom: 13),
      elevation: 0.0,
      highlightElevation: 5,
      color: Color(0xFFFEDD7C),
      shape: StadiumBorder(),
      onPressed: this.onPressed,
      child: Center(
        child: Text(
          this.text,
          style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1.8),
        ),
      ),
    );
  }
}
