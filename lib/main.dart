import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_test/src/app.dart';
import 'package:pokemon_test/src/service/user_model.dart';

String initRoute = '/LoginPage';


//void main() =>  runApp(const App());
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event != null) {
        //Login
        String uid = event.uid;
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .snapshots()
            .listen((event) {
          print('สิ่งนี้คือ even: $event');
          //UserModel model = UserModel.fromMap(map);
          initRoute = '/HomePage';
          runApp(const App());
        });
      } else {
        //Logout
        runApp(const App());
      }
    });
  });
}
