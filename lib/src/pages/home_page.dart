import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_test/src/config/config.dart' as my_theme;
import 'package:pokemon_test/src/pages/widget_grid.dart';
import 'package:pokemon_test/src/service/pokemon_custom_json.dart';
import 'package:pokemon_test/src/service/pokemon_json.dart';
import 'package:pokemon_test/src/service/pokemon_details_json.dart';
import 'package:pokemon_test/src/service/user_model.dart';
import 'package:http/http.dart' as http;

import 'details_page.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key, required this.title}) : super(key: key);
  //
  // final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  String _name = '';
  String _email = '';
  List results_name = [];
  List results_url = [];

  var _URL_Next = 'https://pokeapi.co/api/v2/pokemon/?offset=10&limit=10';

  customJSON? _customList;
  pokemonData? _pokemonDataApi;
  pokomonDetails? _pokemonDataDetails;



  @override
  void initState() {
    print('sd');
    user_get();

    //_scrollController.addListener(scrollListener);
    //getPokemon();
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  void scrollListener(){
    // if(_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange){
    //  // getPokemonNext(_URL_Next);
    // }
  }



  Future<pokomonDetails?> getPokamonDetails(String u) async {
    var response = await http.get(Uri.parse(u));
    _pokemonDataDetails = pokomonDetailsFromJson(response.body);
    // print('xxxxxsx$_pokemonDataDetails');
    //print(response.body);

    //_pokeResult = pokemonData.fromJson(_pokemonDataDetails);
//Sprites
    var sprites_image_Draf = _pokemonDataDetails!.sprites.frontDefault;
    var sprites_name_Draf = _pokemonDataDetails!.name;
    // print('xxxxxxxxxxxxxx ${sprites_name_Draf}');
    return _pokemonDataDetails;
  }


  List<Map> Menu = [];
  Future<pokemonData?> getPokemon() async {
    var response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=10'));
    //print(response.body);
    _pokemonDataApi = pokemonFromJson(response.body);
    var results_name_Draf = _pokemonDataApi!.results.map((e) => e.name);
    var results_url_Draf = _pokemonDataApi!.results.map((e) => e.url);
    var results_Draf = _pokemonDataApi!.results.map((e) => e).toList();

    results_name = results_name_Draf.toList();
    results_url = results_url_Draf.toList();
    Menu = [];
    for(int i = 0 ; i <= 9; i++){
      // var response1 = await http.get(Uri.parse(results_url[i]));
      // _pokemonDataDetails = pokomonDetailsFromJson(response1.body);
      Map x = {'name':results_name[i],'url':results_url[i]};
      Menu.add(x);


    }
   // Map x = {'name':'qq','url':'qwe'};


    print('===========> ${Menu}');
    //custom_json(results_name,results_url);

    //print(_pokemonDataDetails!.sprites.frontDefault);
  }
  // Future<pokemonData?> getPokemonNext(String _URL_Next) async {
  //
  //   var response = await http
  //       .get(Uri.parse(_URL_Next));
  //   //print('=====??>${response.body}');
  //
  //   _pokemonDataApi = pokemonFromJson(response.body);
  //   var results_name_Draf = _pokemonDataApi!.results.map((e) => e.name);
  //   var results_url_Draf = _pokemonDataApi!.results.map((e) => e.url);
  //   var results_Draf = _pokemonDataApi!.results.map((e) => e).toList();
  //
  //   results_name = results_name_Draf.toList();
  //   results_url = results_url_Draf.toList();
  //   List<Map> Menu_Draf = [];
  //   for(int i = 0 ; i <= 9; i++){
  //     // var response1 = await http.get(Uri.parse(results_url[i]));
  //     // _pokemonDataDetails = pokomonDetailsFromJson(response1.body);
  //     Map x = {'name':results_name[i],'url':results_url[i]};
  //     Menu_Draf.add(x);
  //
  //   }
  //   Menu.addAll(Menu_Draf);
  //
  //    print(_pokemonDataApi!.next);
  //    print('${Menu.length}');
  //   print('${Menu[Menu.length-1]['name']}');
  //   // Map x = {'name':'qq','url':'qwe'};
  //
  //
  //   _URL_Next =_pokemonDataApi!.next;
  //   //custom_json(results_name,results_url);
  //
  //   //print(_pokemonDataDetails!.sprites.frontDefault);
  // }

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
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: my_theme.Theme.gradientColors),
          ),
          leading: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'))),
          ),
          title: Column(
            children: [
              Text(
                _name,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                _email,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await Firebase.initializeApp().then((value) async {
                  await FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/LoginPage', (route) => false));
                });
              },
              icon: Icon(
                Icons.exit_to_app,
                size: 28,
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: my_theme.Theme.gradientColors,
              ),
            ),
            FutureBuilder(
                future: getPokemon(),
                builder: (BuildContext context,
                    AsyncSnapshot<pokemonData?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    print('===========..${snapshot.data}');
                    return GridWidget(pokemonDataApi: snapshot.data,Menu: Menu);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),

          ],
        ));
  }

  // view() {
  //   return GridView.count(
  //     crossAxisCount: 2,
  //     children: _pokemonDataApi!.results.map((poke_results) {
  //
  //
  //       return Padding(
  //         padding: const EdgeInsets.all(2.0),
  //         child: InkWell(
  //           onTap: () {
  //            // NavigatorPokemonDetails(poke_results.url);
  //           },
  //           child: Card(
  //             child: Column(
  //               children: <Widget>[
  //                 Container(
  //                   height: 140.0,
  //                   width: 100.0,
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: NetworkImage(
  //                             'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png')),
  //                   ),
  //                 ),
  //                 Text(
  //                   poke_results.name,
  //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     }).toList(),
  //   );
  // }
  // view1() {
  //   return GridView.count(
  //     controller: scrollController,
  //     crossAxisCount: 2,
  //     children: List.generate(Menu.length, (index) {
  //       return Padding(
  //         padding: const EdgeInsets.all(2.0),
  //         child: InkWell(
  //           onTap: () {
  //             //NavigatorPokemonDetails(Menu[index]['url']);
  //           },
  //           child: Card(
  //             child: Column(
  //               children: <Widget>[
  //                 Container(
  //                   height: 140.0,
  //                   width: 100.0,
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: NetworkImage('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index+1}.png')),
  //                   ),
  //                 ),
  //                 Text(
  //                   Menu[index]['name'],
  //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     }),
  //   );
  // }
  //
  // view2() {
  //   return GridView.builder(
  //     controller: scrollController,
  //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //     maxCrossAxisExtent: 200,
  //       childAspectRatio: 1/1,
  //       crossAxisSpacing: 5,
  //       mainAxisSpacing: 5,),
  //     itemCount: Menu.length,
  //     itemBuilder: (BuildContext Context , index) {
  //       return Padding(
  //         padding: const EdgeInsets.all(2.0),
  //         child: InkWell(
  //           onTap: () {
  //          //   NavigatorPokemonDetails(Menu[index]['url']);
  //           },
  //           child: Card(
  //             child: Column(
  //               children: <Widget>[
  //                 Container(
  //                   height: 140.0,
  //                   width: 100.0,
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                         image: NetworkImage('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index+1}.png')),
  //                   ),
  //                 ),
  //                 Text(
  //                   Menu[index]['name'],
  //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     });
  // }

}
