import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pokemon_test/src/config/config.dart' as my_theme;
import 'package:pokemon_test/src/pages/signup_page.dart';
import 'package:pokemon_test/router.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
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
        controller: passwordController,
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
        onPressed: () async {
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
                .then((value) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/HomePage', (route) => false);
            });
          }on FirebaseAuthException catch(e){
            print(e.message);
            alert(e.message.toString());

          }
        },
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
        onPressed: () => login_google(),
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
        onPressed: () => Navigator.pushNamed(context, '/Signup_page'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'สมัครสมาชิก',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<Null> login_google()async{
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
await Firebase.initializeApp().then((value)  async{
  await _googleSignIn.signIn().then((value){

    String? name = value!.displayName;
    String email = value.email;
    print('Google login => name: $name , email: $email');
    // Navigator.pushNamedAndRemoveUntil(context, '/HomePage', (route) => false);
    //   print('Yes!');


    });

});


}

   alert (String m){
     AlertDialog(title: Text("omk"), content: Text("jh"));
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title:  Text('Error'),
            content:  Text(m),
            actions: <Widget>[
            TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
     child: const Text('OK'),
     )]));
   }
}
