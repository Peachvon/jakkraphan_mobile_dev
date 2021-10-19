import 'package:flutter/material.dart';
import 'package:pokemon_test/src/config/config.dart' as my_theme;
import 'package:pokemon_test/src/config/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: my_theme.Theme.gradientColors,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.0),
              input_email(),
              SizedBox(height: 10.0),
              input_password(),
              SizedBox(height: 20.0),
              button_login(),
              SizedBox(height: 50.0),
              Text(
                'หรือเข้าสู่ระบบด้วย',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              button_login_Facebook(),
              button_login_Gmail(),
              SizedBox(height: 50.0),
              button_to_pagesignin(),
            ],
          ),
        )
      ],
    ));
  }

  input_email() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 60.0,
      child: TextField(
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

  input_password() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
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
          contentPadding: EdgeInsets.only(left: 16),
          hintText: 'Password',
        ),
      ),
    );
  }

  button_login() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.85,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login '),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: my_theme.Theme.login,
        child: Text(
          'เข้าสู่ระบบ',
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

  button_login_Facebook() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: MediaQuery.of(context).size.width * 0.85,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Facebook '),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: my_theme.Theme.login_facebook,
        child: Text(
          'Facebook',
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

  button_login_Gmail() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: MediaQuery.of(context).size.width * 0.85,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Gmail '),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: my_theme.Theme.login_gmail,
        child: Text(
          'Gmail',
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

  button_to_pagesignin() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      width: MediaQuery.of(context).size.width * 0.85,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login '),
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
}