import 'package:flutter/material.dart';
import 'package:needzaio_app/widgets/boton_amarillo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
	bool keyboardvisible = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 300.0, end: 50.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _focusNodeEmail.addListener(() {
      if (_focusNodeEmail.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    _focusNodePassword.addListener(() {
      if (_focusNodePassword.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
				
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFEDD7C),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              //top: MediaQuery.of(context).size.height * 0.516,
              top: _animation.value,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(110),
                  ),
                ),
                child: Column(
                  children: [
                    _crearForm(),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   left: 53,
            //   right: 24,
            //   bottom: MediaQuery.of(context).size.height * 0.46,
            //   child: Image.asset('assets/robot.png'),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _crearForm() {
    return InkWell(
			onTap: (){
				FocusScope.of(context).requestFocus(FocusNode());
			},
      child: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            customInput(
                icon: Icons.email_outlined,
                textController: emailController,
                keyboardType: TextInputType.emailAddress,
                hint: 'Email',
                isPassword: false,
                focusNode: _focusNodeEmail),
            customInput(
              icon: Icons.text_format,
              textController: passController,
              keyboardType: TextInputType.text,
              isPassword: true,
              hint: 'Password',
              focusNode: _focusNodePassword,
            ),
            YellowButton(text: 'SIGN IN', onPressed: () {})
          ],
        ),
      ),
    );
  }

  Widget customInput(
      {IconData icon,
      TextEditingController textController,
      TextInputType keyboardType,
      bool isPassword,
      String hint,
      FocusNode focusNode}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        keyboardType: keyboardType,
        obscureText: isPassword,
        autocorrect: false,
        focusNode: focusNode,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}
