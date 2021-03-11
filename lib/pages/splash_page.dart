import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEDD7C),
      body: Stack(
        children: <Widget>[
          _crearSplashImage(context),
          _crearContenido(context),
        ],
      ),
    );
  }

  Positioned _crearContenido(BuildContext context) {
    return Positioned.fill(
      right: 0,
      left: 0,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 53, right: 20, top: 130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'USERAPP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 28),
            Text(
              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam',
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 28),
            MaterialButton(
              padding: EdgeInsets.only(
                top: 12,
                bottom: 13,
              ),
              color: Colors.black,
              shape: StadiumBorder(),
              child: Text(
                'IR A LOGIN',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, letterSpacing: 1.8),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ],
        ),
      ),
    );
  }

  Positioned _crearSplashImage(BuildContext context) {
    return Positioned(
      left: -MediaQuery.of(context).size.width/2.6,
      right: -MediaQuery.of(context).size.width/2,
      top: MediaQuery.of(context).size.width*0.8,
      child: Container(
        child: Image.asset(
          'assets/robot.png',
        ),
      ),
    );
  }
}
