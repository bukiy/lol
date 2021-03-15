import 'package:flutter/material.dart';
import 'package:e_agric/Screens/Login/login_screen.dart';
import 'package:e_agric/Screens/Signup/components/background.dart';
import 'package:e_agric/Screens/Signup/components/or_divider.dart';
import 'package:e_agric/Screens/Signup/components/social_icon.dart';
import 'package:e_agric/components/already_have_an_account_acheck.dart';
import 'package:e_agric/components/rounded_button.dart';
import 'package:e_agric/utils/auth_helper.dart';
import 'package:e_agric/components/rounded_input_field.dart';
import 'package:e_agric/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_agric/components/text_field_container.dart';
import 'package:e_agric/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<Body> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _nameController = TextEditingController(text: "");
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
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/002-corn.svg",
              height: size.height * 0.30,
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
                controller: _nameController,
                // onChanged: (value) {},
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  hintText: "Full Name",
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
                      final user = await AuthHelper.signupWithEmail(
                          email: _emailController.text,
                          password: _passwordController.text,
                          name: _nameController.text);
                      if (user != null) {
                        print("signup successful");
                        // Navigator.pop(context);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

































