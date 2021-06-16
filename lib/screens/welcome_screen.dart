import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flash_chat/Components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String routeName = "/welcome";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  // Animation animation;

  @override
  void initState() {
    super.initState();
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 250.0,
    );
    controller.forward(from: 100.00);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/chat.png'),
                    alignment: Alignment.center,
                    height: controller.value,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              color: Colors.green[300],
              title: 'log in',
              onpressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
            RoundedButton(
              color: Colors.green[400],
              title: 'register',
              onpressed: () {
                Navigator.pushNamed(context, RegistrationScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
