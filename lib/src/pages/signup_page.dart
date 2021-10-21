import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_test/src/config/config.dart' as my_theme;
import 'package:pokemon_test/src/service/user_model.dart';
import 'package:pokemon_test/router.dart';
import 'package:pokemon_test/src/utils/RegexValidator.dart';

class Signup_page extends StatefulWidget {
  @override
  _Signup_page createState() => _Signup_page();
}

class _Signup_page extends State<Signup_page> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late String _err;
  var _check_color = my_theme.Theme.check_false_color;
  var _check_icon = my_theme.Theme.check_false_icon;
  var _check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // emailController?.dispose();
    // passwordController?.dispose();
    // nameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'สมัครสมาชิก',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: my_theme.Theme.gradientColors,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    signup_name(),
                    SizedBox(height: 20.0),
                    signup_email(),
                    SizedBox(height: 20.0),
                    signup_password(),
                    SizedBox(height: 20.0),
                    signup_confirm(),
                    SizedBox(height: 20.0),
                    validate_signup(),
                    SizedBox(height: 80.0),
                    button_signup(),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  validate_signup() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white70,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.85,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Password ต้องประกาอบไปด้วย :',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Icon(
                _check_icon,
                size: 18,
                color: _check_color,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'จำนวนตัวอักขระรวมกันไม่น้อยกว่า 8 ตัว',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: _check_color,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 18,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'ตัวอักษรพิมพ์ใหญ์ (A-Z) อย่างน้อย 1 ตัว',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 18,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'ตัวอักษรพิมพ์ใหญ์ (a-z) อย่างน้อย 1 ตัว',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 18,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'ตัวเลข (0-9) อย่างน้อย 1 ตัว',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  signup_name() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.85,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 60.0,
      child: TextField(
        controller: nameController,
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 16.0),
          hintText: 'ชื่อ-นามสกุล',
        ),
      ),
    );
  }

  signup_email() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.85,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 60.0,
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 16.0),
          hintText: 'Email',
        ),
      ),
    );
  }

  signup_password() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.85,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 60.0,
      child: TextField(
        controller: passwordController,
        onChanged: (passwordController) {
          String password = passwordController;
          if (password.length < 8) {
            _check_icon = my_theme.Theme.check_false_icon;
            _check_color = my_theme.Theme.check_false_color;
            _check1 = false;
          } else {
            _check_icon = my_theme.Theme.check_true_icon;
            _check_color = my_theme.Theme.check_true_color;
            _check1 = true;
          }

          // if (!EmailSubmitRegexValidator().isValid(password)) {
          //   print('123123123132');
          // }
          print('$password');
          setState(() {});
        },
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 16.0),
          hintText: 'Password',
        ),
      ),
    );
  }

  signup_confirm() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.85,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 60.0,
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 16.0),
          hintText: 'Confirm Password',
        ),
      ),
    );
  }

  button_signup() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.85,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {creatAccount()},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: my_theme.Theme.login,
        child: Text(
          'สมัครสมาชิก',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // final Future<FirebaseApp> firebase = Firebase.initializeApp();
  Future<Null> creatAccount() async {
    await Firebase.initializeApp().then((value) async {
      if (_check1 == true) {
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
              .then((value) async {
            await value.user!
                .updateDisplayName(nameController.text)
                .then((value2) async {
              String uid = value.user!.uid;
              print('update $uid');
              UserModel model = UserModel(email: emailController.text, name: nameController.text);
              Map<String, dynamic> data = model.toMap();

              await FirebaseFirestore.instance.collection('user').doc(uid).set(data).then((value) {

                Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
                print('firestro');
              });
                });
          });
        } on FirebaseAuthException catch (e) {

          print(e.message);
        }
      }
    });
  }
}
