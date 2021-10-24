import 'package:flutter/material.dart';
import 'package:pokemon_test/src/service/pokemon_json.dart';
import 'package:pokemon_test/src/config/config.dart' as my_theme;

class Details extends StatelessWidget {

  late final String name;
  late final String image;
  late final String id;
  late final String height;
  late final String weight;
  late final String baseExperience;
  late final String abilities;


  Details({required this.name,
    required this.image,
    required this.id,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.abilities,

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
                  Container(width: MediaQuery.of(context).size.width * 0.72,
                    padding: EdgeInsets.only(top: 10),

                    child: Column(
                    children: [
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                             width: MediaQuery.of(context).size.width * 0.45,
                              child: Text('ID'),
                         ),
                          Text(': No. $id'),
                        ],
                      ),

                      Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text('height'),
                          ),
                          Text(': $height cm'),
                        ],
                      ),
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text('weight'),
                          ),
                          Text(': $weight kg'),
                        ],
                      ),
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text('EXP'),
                          ),
                          Text(': $baseExperience'),
                        ],
                      ),




                    ],
                  ),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(

                        padding: EdgeInsets.only(top: 20,bottom: 20),
                        width: MediaQuery.of(context).size.width * 0.72,

                            child: Text('ข้อมูล',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ,),


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
             ),

        ],
      ),
    );
  }


}

