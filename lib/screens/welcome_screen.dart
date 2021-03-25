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

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  // Animation animation;

  @override
  void initState() {
    super.initState();
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller = AnimationController(
      duration: Duration(seconds: 1), vsync: this, upperBound: 100.0);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
               Hero (
                tag: 'logo',
                child:Container(
                  child: Image.asset('images/logo.png'),
                  height: controller.value,
                ),
    ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(color: Colors.lightBlueAccent,title: 'log in', onpressed: (){
              Navigator.pushNamed(context, LoginScreen.routeName);
            },),
            RoundedButton(color: Colors.blueAccent,title: 'Register',onpressed:(){
              Navigator.pushNamed(context, RegistrationScreen.routeName);
            },),
          ],
        ),
      ),
    );
  }
}

