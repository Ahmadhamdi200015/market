import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterahmad/controller/test_controller.dart';
import 'package:flutterahmad/core/funcation/staterequest.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TestView extends StatelessWidget {
  const TestView({super.key});


  static const List nameofphone = [
    {"name": "iphone11"},
    {"name": "iphone12"},
    {"name": "iphone13"},
    {"name": "iphone14"},
    {"name": "iphone15"},
    {"name": "iphone16"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child:Column(children: [
            Container(
              child:Row(
                children: [
                Expanded(flex: 1,child:Container(margin: EdgeInsets.only(top:20), padding:EdgeInsets.all(17) ,child: Image.asset("assets/images/logo.png",width: 100,)),),
                  Expanded(flex: 2,child: Container(margin: EdgeInsets.only(top:20),child:ListTile(subtitle: Text("aboodelk@gmail.com"), title:Text("Aboodelkahlout"),)),)
                ],
              ),
            ),
            Container( margin: const EdgeInsets.only(top: 20) ,child:const Divider(color:Colors.black ,height: 2,indent:20,endIndent: 20,)),
            Container(margin:const EdgeInsets.only(top:15),child:Row(children: [
            Expanded(flex: 1, child:Container(child:const Icon(Icons.home,size: 40,),)),
    Expanded(flex:2, child:Container( margin: const EdgeInsets.only(top: 7), child:const Text("HOME",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)))
            ],)
              ,),

            Container(margin:const EdgeInsets.only(top: 15),child:Row(children: [
              Expanded(flex: 1, child:Container(child:const Icon(Icons.settings,size: 40,),)),
              Expanded(flex:2, child:Container( margin: const EdgeInsets.only(top: 7), child:const Text("SITTING",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)))
            ],)
              ,),
            Container(margin:const EdgeInsets.only(top: 15),child:Row(children: [
              Expanded(flex: 1, child:Container(child:const Icon(Icons.phone,size: 40,),)),
              Expanded(flex:2, child:Container( margin: const EdgeInsets.only(top: 7), child:const Text("CONTACT US",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)))
            ],)
              ,),
            Container(margin:const EdgeInsets.only(top: 15),child:Row(children: [
              Expanded(flex: 1, child:Container(child:const Icon(Icons.home,size: 40,),)),
              Expanded(flex:2, child:Container( margin: const EdgeInsets.only(top: 7), child:const Text("Home",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)))
            ],)
              ,),
            Container(margin:const EdgeInsets.only(top: 15),child:Row(children: [
              Expanded(flex: 1, child:Container(child:const Icon(Icons.home,size: 40,),)),
              Expanded(flex:2, child:Container( margin: const EdgeInsets.only(top: 7), child:const Text("Home",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)))
            ],)
              ,)

          ],),
        ),
      ),
       appBar: AppBar(title:const Text("data"),
       backgroundColor:Colors.blue),
        body: Container(padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    width: 100,
                    height: 120,
                    child: Column(children: [
                      ListTile(title: const Text("Our", style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                        subtitle: Container(margin: const EdgeInsets.only(left: 10),
                            child: const Text("Products", style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),)),)
                    ],)

                ),

                Container(margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(flex: 4, child: TextFormField(

                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.search),
                            hintText: "find products",
                            labelText: "find products",
                            border: OutlineInputBorder(borderSide: const BorderSide(
                                width: 2), borderRadius: BorderRadius.circular(
                                20))),
                      ),),

                      Expanded(flex: 1, child:
                      Container(margin: const EdgeInsets.only(left: 10),
                        width: 30,
                        height: 60,
                        decoration: BoxDecoration(color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.favorite, color: Colors.red,),)
                      ),
                    ],
                  ),
                ),

                Stack(children: [
                  Container(padding: const EdgeInsets.all(10),
                    width: 400,
                    height: 200,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),),),
                  Positioned(top: 50,
                      left: 15,
                      child: Container(child: Column(children: [
                        Container(margin: const EdgeInsets.only(right: 70, top: 15),
                          child: const Text("Our", style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),),)
                        ,
                        Container(margin: const EdgeInsets.only(left: 30),
                          child: const Text("Products", style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),)
                      ],))),

                  Positioned(right: -25, top: 150, child: Container(
                    decoration: BoxDecoration(color: Colors.red,
                        borderRadius: BorderRadius.circular(130)),
                    width: 140,
                    height: 150,

                  )),
                ]),
                Container(
                  //   decoration: BoxDecoration(border:Border.all(width: 2,color: Colors.red) ),
                  margin: const EdgeInsets.only(top: 20, left: 10),
                  child: const Text("Categroies", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      separatorBuilder: (context, i) => const SizedBox(width: 10,),
                      scrollDirection: Axis.horizontal,
                      itemCount: nameofphone.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(color: Colors.grey[100]),
                          child:
                          Row(children: [
                            // Icon(Icons.phone_iphone),
                            // Text("AhmadHamdi")
                            const Expanded(flex: 1, child: Icon(Icons.phone_iphone)),
                            Expanded(flex: 1, child: Text(
                                nameofphone[i]["name"]))

                          ],),
                        );
                      }),
                ),
                Container(
                  //  decoration:BoxDecoration(border:Border.all(width: 2,color: Colors.red)),
                  margin: const EdgeInsets.only(top: 20, left: 10),
                  child: const Text("products for you", style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),
                ),

                /* Container(height: 100,color:Colors.black,
                child:ListView.separated(separatorBuilder: (context, index) => SizedBox(width: 5,),
                    itemCount:nameofphone.length,
                    scrollDirection:Axis.horizontal,
                  itemBuilder:(context,i){
                      return Container(
                        decoration: BoxDecoration(color:Colors.red,borderRadius: BorderRadius.all(Radius.circular(20))),
                        padding:EdgeInsets.only(top: 25),
                        width: 100,
                        child:
                        Column(children: [
                          Icon(Icons.phone_iphone,size: 40,),
                          Text(nameofphone[i]["name"],style: TextStyle(fontSize:15),),
                        ],),

                      );
                  } ,
                  )
                  ,)*/

              Container(
                  child: GridView.builder(
                  physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),itemCount: nameofphone.length, itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10,bottom: 10),
                      decoration: const BoxDecoration(color:Colors.grey,borderRadius:BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.phone_iphone),
                          Text(nameofphone[i]["name"])
                        ],
                      ),
                    );
                  }),


                )




              ]),
        )
    );
  }
}
