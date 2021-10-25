import 'package:flutter/material.dart';
import 'package:pokemon_test/src/service/pokemon_details_json.dart';
import 'package:pokemon_test/src/service/pokemon_json.dart';
import 'package:http/http.dart' as http;

import 'details_page.dart';

class GridWidget extends StatefulWidget {
  final pokemonData? pokemonDataApi;
  final List<Map>? Menu;

  GridWidget({Key? key, this.pokemonDataApi, this.Menu,}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GridWidgetState();
}

class GridWidgetState extends State<GridWidget> {


  final ScrollController scrollController = new ScrollController();
  pokomonDetails? _pokemonDataDetails;
  pokemonData? _pokemonDataApi;


  Future<pokomonDetails?> NavigatorPokemonDetails(String u) async {
    var response = await http.get(Uri.parse(u));
    _pokemonDataDetails = pokomonDetailsFromJson(response.body);
    // print('xxxxxsx$_pokemonDataDetails');
    print(response.body);

    //_pokeResult = pokemonData.fromJson(_pokemonDataDetails);
//Sprites

    var sprites_image_Draf = _pokemonDataDetails!.sprites.frontDefault;
    var sprites_name_Draf = _pokemonDataDetails!.name;
    var sprites_weight_Draf = _pokemonDataDetails!.weight;
    var sprites_height_Draf = _pokemonDataDetails!.height;
    var sprites_id_Draf = _pokemonDataDetails!.id;
    var sprites_baseExperience_Draf = _pokemonDataDetails!.baseExperience;
    var sprites_abilities_Draf =
    _pokemonDataDetails!.abilities.map((e) => e.ability.name);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => Details(
    //           name: sprites_name_Draf,
    //           image: sprites_image_Draf,
    //           id: sprites_id_Draf.toString(),
    //           height: sprites_height_Draf.toString(),
    //           weight: sprites_weight_Draf.toString(),
    //           baseExperience: sprites_baseExperience_Draf.toString(),
    //           abilities: sprites_abilities_Draf.toString(),
    //
    //         )));
  }

  List results_name = [];
  List results_url = [];
  String _next_url = 'https://pokeapi.co/api/v2/pokemon/?offset=10&limit=10';
  Future<pokemonData?> getPokemonNext() async {
    print('========>${_next_url}');
    var response = await http
        .get(Uri.parse(_next_url));
    //print(response.body);
    _pokemonDataApi = pokemonFromJson(response.body);
    var results_name_Draf = _pokemonDataApi!.results.map((e) => e.name);
    var results_url_Draf = _pokemonDataApi!.results.map((e) => e.url);
    var results_Draf = _pokemonDataApi!.results.map((e) => e).toList();

    results_name = results_name_Draf.toList();
    results_url = results_url_Draf.toList();

    for(int i = 0 ; i <= 9; i++){
      // var response1 = await http.get(Uri.parse(results_url[i]));
      // _pokemonDataDetails = pokomonDetailsFromJson(response1.body);
      Map x = {'name':results_name[i],'url':results_url[i]};
      setState(() {

     widget.Menu!.add(x);
      });


    }
    _next_url = 'https://pokeapi.co/api/v2/pokemon/?offset=${widget.Menu!.length}&limit=10';
    // Map x = {'name':'qq','url':'qwe'};
    print('========<<<<${_next_url}');

    //print('===========> ${widget.Menu!}');
    //custom_json(results_name,results_url);

    //print(_pokemonDataDetails!.sprites.frontDefault);
  }
  bool onNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {

          getPokemonNext();


      }
    }
    return true;
  }


  @override
  void initState() {
    //scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }
  // void scrollListener(){
  //   if(scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange){
  //    // getPokemonNext(_URL_Next);
  //   }


  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: onNotification,
      child: new GridView.builder(
        padding: EdgeInsets.only(
          top: 5.0,
        ),   // EdgeInsets.only
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
        ),  // SliverGridDelegateWithFixedCrossAxisCount
        controller: scrollController,
        itemCount: widget.Menu!.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
               // NavigatorPokemonDetails(widget.Menu![index]['url']);
                String url = widget.Menu![index]['url'];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(
                          url: url,


                        )));
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 140.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index+1}.png')),
                      ),
                    ),
                    Text(
                      widget.Menu![index]['name'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );;
        },
      ),  // GridView.builder
    );  // NotificationListener
  }


}