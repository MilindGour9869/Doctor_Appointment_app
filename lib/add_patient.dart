import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class AddPatient extends StatefulWidget {
  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {

  var patient_name=TextEditingController();
  var patient_gender ;

  TextEditingController group = new TextEditingController();

  File jsonFile;
  Directory dir;
  String fileName = "group.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  var default_group = [ "tac" , " toe"];
  var select_group= TextEditingController();
  String selected_group;






  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;

      print(dir);

      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));

  });

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    group.dispose();
  }

  void createFile(Set<String> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key) {
    print("Writing to file!");
    Set<String> content = {key};
    if (fileExists) {
      print("File exists");
      var jsonFileContent = json.decode(jsonFile.readAsStringSync());
      print(jsonFileContent.runtimeType);
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    print(fileContent);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('New '),
            TextButton.icon(onPressed: (){}, icon: Icon(Icons.save , color: Colors.white,), label: Text(''))
          ],
        ),

      ),

      body: SingleChildScrollView(
        child: Column(

          children: [

            Row(
              children: [
                Icon(Icons.person),
                Container(
                  width: 200,
                  child: TextField(
                    controller: patient_name,


                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.person) ,
                GestureDetector(
                  onTap: (){
                    print('male');
                    patient_gender="male";


                  },
                  child: Container(
                    child: Text('male'),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    print('female');
                    patient_gender="female";


                  },
                  child: Container(
                    child: Text('female'),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    print('other');
                    patient_gender="other";


                  },
                  child: Container(
                    child: Text('other'),

                  ),
                ),
              ],
            ),
            
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(

                 width: MediaQuery.of(context).size.width*0.7,
                 child: TextFormField(
                   controller:select_group ,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(),

                   )

                 ),
               ),


               TextButton.icon(onPressed: (){
                       showDialog(context: context, builder: (context)=>

                           Padding(
                             padding: const EdgeInsets.all(40.0),
                             child: Container(

                         color: Colors.red,
                               child: Column(
                                 children: [
                                   Material(
                                     child: TextField(
                                       controller: select_group,
                                       decoration: InputDecoration(
                                         prefixIcon: Icon(Icons.settings),
                                         hintText: "search / Add"
//                                         suffixIcon: TextButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text(''))
                                       ),
                                     ),
                                   ),

                                 ],
                               )
                       ),
                           ));

               }, icon: Icon(Icons.arrow_drop_down_circle), label: Text(''))
             ],
           ),









          ],

        ),
      ),
    );
  }
}
