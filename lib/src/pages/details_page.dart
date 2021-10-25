import 'package:flutter/material.dart';
import 'package:pokemon_test/src/service/pokemon_details_json.dart';
import 'package:pokemon_test/src/service/pokemon_json.dart';
import 'package:pokemon_test/src/config/config.dart' as my_theme;
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {


   final String? url;

   Details({Key? key, this.url,}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DetailsState();

}
class DetailsState extends State<Details> {

  String name ='';
  String image = '';
  String ID ='';
  String hp = '';
  String attack = '';
  String defense = '';
  String speed = '';
  String special_attack = '';
  String special_defense = '';


  pokomonDetails? _pokemonDataDetails;

  Future<pokomonDetails?> PokemonDetails(String u) async {
    var response = await http.get(Uri.parse(u));
    _pokemonDataDetails = pokomonDetailsFromJson(response.body);
    // print('xxxxxsx$_pokemonDataDetails');
    print(response.body);



    image = _pokemonDataDetails!.sprites.frontDefault;
    name = _pokemonDataDetails!.name;
   
    ID = _pokemonDataDetails!.id.toString();


    var stats_Draf = _pokemonDataDetails!.stats.map((e) => e).toList();
    hp = stats_Draf[0].baseStat.toString();
    attack = stats_Draf[1].baseStat.toString();
    defense = stats_Draf[2].baseStat.toString();
    special_attack = stats_Draf[3].baseStat.toString();
    special_defense = stats_Draf[4].baseStat.toString();
    speed = stats_Draf[5].baseStat.toString();

    print(
        '${stats_Draf[0].baseStat}');
//    _pokemonDataDetails!.stats.map((e) {
//
//     switch (e.stat.name){
//     case 'hp':{
//     hp = e.baseStat.toString();}
//     break;
//     case 'attack':{
//     attack = e.baseStat.toString();}
//     break;
//     case 'defense':{
//     defense = e.baseStat.toString();}
//     break;
//     case 'speed':{
//     speed = e.baseStat.toString();}
//     break;
//     case 'special-attack':{
//       special_attack = e.baseStat.toString();}
//     break;
//     case 'special-defense':{
//       special_defense = e.baseStat.toString();}
//     break;
//       default:{}
//         break;
//     }
// print(e.baseStat);
//
//     });



   print(_pokemonDataDetails!.stats.map((e) => e.stat.name));
   print(_pokemonDataDetails!.stats.map((e) => e.baseStat));




  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: my_theme.Theme.gradientColors),
          ),
          title: Text(
            'รายละเอียด',
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
          FutureBuilder(
              future: PokemonDetails(widget.url.toString()),
            builder: (BuildContext context,
    AsyncSnapshot<pokomonDetails?> snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {

    return ff();
    } else {
    return Center(child: CircularProgressIndicator());
    }
    }


          ),
        ],
      ),
    );
  }
  ff (){
  return  Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image))),
        ),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 50.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.72,
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('HP'),
                  ),
                  Text(': $hp'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Attack'),
                  ),
                  Text(': $attack'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Defense'),
                  ),
                  Text(': $defense'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Special Attack'),
                  ),
                  Text(': $special_attack'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Special Defense'),
                  ),
                  Text(': $special_defense'),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text('Speed'),
                  ),
                  Text(': $speed'),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              width: MediaQuery.of(context).size.width * 0.72,
              child: Text(
                'ข้อมูล',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.72,
              child: Text('xxxxxxxxxxxxxxxxx'),
            )
          ],
        ),
      ],
    ),
  );
  }
}
