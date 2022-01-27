import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class ContactsPage extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  TextEditingController keyInputController = new TextEditingController();
  TextEditingController valueInputController = new TextEditingController();

  File jsonFile;
  Directory dir;
  String fileName = "myFile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  @override
  void initState() {
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
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, dynamic value) {
    print("Writing to file!");
    Map<String, dynamic> content = {key: value};
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
    print('ww');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("JSON Tutorial"),),
      body: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("File content: ", style: new TextStyle(fontWeight: FontWeight.bold),),
          new Text(fileContent.toString()),
          new Padding(padding: new EdgeInsets.only(top: 10.0)),
          new Text("Add to JSON file: "),
          new TextField(
            controller: keyInputController,
          ),
          new TextField(
            controller: valueInputController,
          ),
          new Padding(padding: new EdgeInsets.only(top: 20.0)),
          new RaisedButton(
            child: new Text("Add key, value pair"),
            onPressed: () => writeToFile(keyInputController.text, valueInputController.text),
          )
        ],
      ),
    );
  }
}
