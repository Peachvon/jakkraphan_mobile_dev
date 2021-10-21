import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_test/src/config/config.dart' as my_theme;
import 'package:pokemon_test/src/service/user_model.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key, required this.title}) : super(key: key);
  //
  // final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 String _name = '';
 String _email = '';
  @override
  void initState() {
    user_get();
  }
    Future<Null> user_get() async {
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

              UserModel model = UserModel.fromMap(event.data()!);

              setState(() {
                _name = model.name;
                _email = model.email;
              });

            });
          } else {
            //Logout

          }
        });
      });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        flexibleSpace: Container(decoration: BoxDecoration(gradient: my_theme.Theme.gradientColors),),

        leading: Text('image'),
        title: Column(
          children: [
            Text(_name,style: TextStyle(fontSize: 18),),
            Text(_email,style: TextStyle(fontSize: 18),),
          ],
        ),
        actions: [
       IconButton(onPressed: () async{
        await Firebase.initializeApp().then((value) async{
          await FirebaseAuth.instance.signOut().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/LoginPage', (route) => false));
        });
       }, icon: Icon(
         Icons.exit_to_app,
         size: 28,
       ),)
        ],

      ),
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: my_theme.Theme.gradientColors,
          ),
        ),

        GridView.count(
          crossAxisCount: 2,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Text('asdas'),
                    Container(
                      height: 100.0,
                      width: 100.0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }

  AppBar_home() {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Text('image'),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ชื่อ-นามสกุล',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        'E-mail',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.exit_to_app,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
