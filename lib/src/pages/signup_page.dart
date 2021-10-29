// ignore_for_file: non_constant_identifier_names, unused_field, prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_test/src/config/config.dart' as my_theme;
import 'package:pokemon_test/src/service/user_model.dart';

class Signup_page extends StatefulWidget {
  @override
  _Signup_page createState() => _Signup_page();
}

class _Signup_page extends State<Signup_page> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirm_passwordController;
  late TextEditingController nameController;
  late String _err;
  var _check_color1 = my_theme.Theme.check_false_color;
  var _check_color2 = my_theme.Theme.check_false_color;
  var _check_color3 = my_theme.Theme.check_false_color;
  var _check_color4 = my_theme.Theme.check_false_color;
  var _check_icon1 = my_theme.Theme.check_false_icon;
  var _check_icon2 = my_theme.Theme.check_false_icon;
  var _check_icon3 = my_theme.Theme.check_false_icon;
  var _check_icon4 = my_theme.Theme.check_false_icon;
  bool _check1 = false;
  bool _check2 = false;
  bool _check3 = false;
  bool _check4 = false;
  bool _check_All = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirm_passwordController = TextEditingController();
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
            foregroundColor: Colors.black,
            flexibleSpace: Container(
              decoration:
                  BoxDecoration(gradient: my_theme.Theme.gradientColors),
            ),
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
      width: MediaQuery.of(context).size.width * 0.85,
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
                _check_icon1,
                size: 18,
                color: _check_color1,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'จำนวนตัวอักขระรวมกันไม่น้อยกว่า 8 ตัว',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: _check_color1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                _check_icon2,
                size: 18,
                color: _check_color2,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'ตัวอักษรพิมพ์ใหญ์ (A-Z) อย่างน้อย 1 ตัว',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: _check_color2,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                _check_icon3,
                size: 18,
                color: _check_color3,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'ตัวอักษรพิมพ์ใหญ์ (a-z) อย่างน้อย 1 ตัว',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: _check_color3,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                _check_icon4,
                size: 18,
                color: _check_color4,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'ตัวเลข (0-9) อย่างน้อย 1 ตัว',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: _check_color4,
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
      width: MediaQuery.of(context).size.width * 0.85,
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
      width: MediaQuery.of(context).size.width * 0.85,
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
      width: MediaQuery.of(context).size.width * 0.85,
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
          String pattern =
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

          String pattern2 = r'^(?=.*?[A-Z]).';
          String pattern3 = r'^(?=.*?[a-z]).';
          String pattern4 = r'^(?=.*?[0-9]).';
          RegExp regExp2 = new RegExp(pattern2);
          RegExp regExp3 = new RegExp(pattern3);
          RegExp regExp4 = new RegExp(pattern4);

          if (password.length < 8) {
            _check_icon1 = my_theme.Theme.check_false_icon;
            _check_color1 = my_theme.Theme.check_false_color;
            _check1 = false;
          } else {
            _check_icon1 = my_theme.Theme.check_true_icon;
            _check_color1 = my_theme.Theme.check_true_color;
            _check1 = true;
          }

          if (regExp2.hasMatch(password) == false) {
            _check_icon2 = my_theme.Theme.check_false_icon;
            _check_color2 = my_theme.Theme.check_false_color;
            _check2 = false;
          } else {
            _check_icon2 = my_theme.Theme.check_true_icon;
            _check_color2 = my_theme.Theme.check_true_color;
            _check2 = true;
          }
          if (regExp3.hasMatch(password) == false) {
            _check_icon3 = my_theme.Theme.check_false_icon;
            _check_color3 = my_theme.Theme.check_false_color;
            _check3 = false;
          } else {
            _check_icon3 = my_theme.Theme.check_true_icon;
            _check_color3 = my_theme.Theme.check_true_color;
            _check3 = true;
          }
          if (regExp4.hasMatch(password) == false) {
            _check_icon4 = my_theme.Theme.check_false_icon;
            _check_color4 = my_theme.Theme.check_false_color;
            _check4 = false;
          } else {
            _check_icon4 = my_theme.Theme.check_true_icon;
            _check_color4 = my_theme.Theme.check_true_color;
            _check4 = true;
          }

          if (_check1 == true &&
              _check2 == true &&
              _check3 == true &&
              _check4 == true) {
            _check_All = true;
          } else {
            _check_All = false;
          }
          print(_check1);
          print(_check2);
          print(_check3);
          print(_check4);
          print(_check_All);

          // if (!EmailSubmitRegexValidator().isValid(password)) {
          //   print('123123123132');
          // }

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
      width: MediaQuery.of(context).size.width * 0.85,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 60.0,
      child: TextField(
        controller: confirm_passwordController,
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
      width: MediaQuery.of(context).size.width * 0.85,
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

  // String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  // final Future<FirebaseApp> firebase = Firebase.initializeApp();
  Future<void> creatAccount() async {
    await Firebase.initializeApp().then((value) async {
      print(nameController.text);

      if (_check_All == true &&
          confirm_passwordController.text == passwordController.text &&
          nameController.text != '') {
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
              UserModel model = UserModel(
                  email: emailController.text, name: nameController.text);
              Map<String, dynamic> data = model.toMap();

              await FirebaseFirestore.instance
                  .collection('user')
                  .doc(uid)
                  .set(data)
                  .then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/HomePage', (route) => false);
                print('firestro');
              });
            });
          });
        } on FirebaseAuthException catch (e) {
          print('Error: ${e.message}');
          alert(e.message.toString());
        }
      } else if (nameController.text == '') {
        alert_Validation('ไม่สามารถสมัครสมาชิกได้', 'กรุณาใส่ชื่อ');
      } else if (_check_All == false) {
        alert_Validation(
            'ไม่สามารถสมัครสมาชิกได้', 'Passwordไม่ตรงตามเงื่อนไข');
      } else if (passwordController.text != confirm_passwordController.text) {
        alert_Validation('ไม่สามารถสมัครสมาชิกได้', 'Passwordไม่ตรงกัน');
      }
    });
  }

  alert(String message) {
    AlertDialog(title: Text("omk"), content: Text("jh"));
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                title: Text('Error'),
                content: Text(message),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('OK'),
                  )
                ]));
  }

  alert_Validation(String title, String message) {
    AlertDialog(title: Text("omk"), content: Text("jh"));
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('OK'),
                  )
                ]));
  }
}
