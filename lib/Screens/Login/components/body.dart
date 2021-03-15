import 'package:flutter/material.dart';
import 'package:e_agric/Screens/Login/components/background.dart';
import 'package:e_agric/Screens/Signup/signup_screen.dart';
import 'package:e_agric/components/already_have_an_account_acheck.dart';
import 'package:e_agric/components/rounded_button.dart';
import 'package:e_agric/components/rounded_input_field.dart';
import 'package:e_agric/components/rounded_password_field.dart';
import 'package:e_agric/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_agric/constants.dart';
import 'package:e_agric/utils/auth_helper.dart';


class Body extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Body> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/034-greenhouse-effect.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                controller: _emailController,
                // onChanged: (value) {},
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  hintText: "Your Email",
                  border: InputBorder.none,
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                // onChanged: (value) {},
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),


            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: kPrimaryColor,
                  onPressed: ()  async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      print("Email and password cannot be empty");
                      return;
                    }
                    try {
                      final user = await AuthHelper.signInWithEmail(
                          email: _emailController.text,
                          password: _passwordController.text);
                      if (user != null) {
                        print("login successful");
                      }
                    } catch (e) {
                      print(e);
                    }
                  },

                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
