import 'package:flutter/material.dart';
import 'package:pokemon_test/src/service/pokemon_json.dart';
import 'package:pokemon_test/src/config/config.dart' as my_theme;

class Details extends StatelessWidget {

  late final String name;
  late final String image;

  Details({required this.name, required this.image
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          flexibleSpace: Container(
            decoration:
            BoxDecoration(gradient: my_theme.Theme.gradientColors),
          ),
          title: Text('รายละเอียด',
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
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(image)
                        )
                    ),
                  ),
                  Text(name,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 50.0,),
                  Container(width: MediaQuery.of(context).size.width * 0.80,
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
                          Text(': $name'),
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
                          Text(': $name'),
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
                          Text(': $name'),
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
                          Text(': $name'),
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
                          Text(': $name'),
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
                          Text(': $name'),
                        ],
                      ),
                    ],
                  ),),
                  Container(),
                ],
            ),
             ),

        ],
      ),
    );
  }


}

