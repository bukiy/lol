import 'package:e_agric/Screens/Signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_agric/Screens/Welcome/welcome_screen.dart';
import 'package:e_agric/utils/auth_helper.dart';
import 'package:e_agric/Screens/Signup/components/body.dart';
import 'package:e_agric/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.data != null) {

            UserHelper.saveUser(snapshot.data);
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection("users").doc(snapshot.data.uid).snapshots() ,
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                if(snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  final user = userDoc.data();
                  if(user['role'] == 'user') {
                    return WelcomeScreen();
                  }else{
                    return WelcomeScreen();
                  }
                }else{
                  return Material(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }
              },
            );
          }
          return WelcomeScreen();
        }
    );
  }
}

// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if(snapshot.hasData && snapshot.data != null) {
//             return WelcomeScreen();
//           }
//           return WelcomeScreen();
//         }
//     );
//   }
// }
