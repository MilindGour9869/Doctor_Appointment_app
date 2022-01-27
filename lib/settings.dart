import 'package:flutter/material.dart';
import 'add_patient.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(

                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), topLeft: Radius.circular(30),


                )
            ),
            child:SingleChildScrollView(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(onPressed: (){
                          print('fdf');
                        }, icon: Icon(Icons.home , color: Colors.white,), label: Text('Home' , style: TextStyle(color: Colors.white),)),
                        TextButton.icon(onPressed: (){
                          print('fdf');
                        }, icon: Icon(Icons.home , color: Colors.white,), label: Text('Home' , style: TextStyle(color: Colors.white),)),
                        TextButton.icon(onPressed: (){
                          print('fdf');
                        }, icon: Icon(Icons.home , color: Colors.white,), label: Text('Home' , style: TextStyle(color: Colors.white),)),



                      ],
                    ),
                  ),
                  Container(

                    height: MediaQuery.of(context).size.height*0.24,
                    width: MediaQuery.of(context).size.width*0.9,

                    decoration:BoxDecoration(

                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),

                    ) ,

                    child: Text('cswc'),
                  ),


                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
                alignment: Alignment.bottomCenter,

                child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,

                    ),
                    child: TextButton.icon(onPressed: (){

                      print('add pateint');

                      Navigator.push(context , MaterialPageRoute(builder: (context)=>AddPatient()));


                    }, icon: Icon(Icons.add , color: Colors.red,), label: Text('Add Patient' , style: TextStyle(color: Colors.black),) ))),
          )
        ],
      ),

      bottomNavigationBar: Container(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           TextButton.icon(onPressed: (){
             print('fdf');
           }, icon: Icon(Icons.home , color: Colors.white,), label: Text('Home' , style: TextStyle(color: Colors.white),)),
            TextButton.icon(onPressed: (){
              print('fdf');
            }, icon: Icon(Icons.home , color: Colors.white,), label: Text('Home' , style: TextStyle(color: Colors.white),)),
            TextButton.icon(onPressed: (){
              print('fdf');
            }, icon: Icon(Icons.home , color: Colors.white,), label: Text('Home' , style: TextStyle(color: Colors.white),)),



          ],
        ),
      ),


    );
  }
}
