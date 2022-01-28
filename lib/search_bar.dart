import 'package:flutter/material.dart';

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {

  TextEditingController _textController_group = TextEditingController();



  Color _group_color=Colors.grey;



  static List<String> mainDataList = [
  "Diabetic",
    "High Blood Pressure"
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
      if(newDataList.isEmpty)
        {
          newDataList=[];
        }
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController_group,
              decoration: InputDecoration(
                hintText: 'Search / Add ',
                prefixIcon: Icon(Icons.search)
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.isNotEmpty==true?newDataList.map((data) {
                var _editing_controller = TextEditingController(text: data);

                return ListTile(

                  title:Container(

                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(onPressed: (){


                          }, icon: Icon(Icons.check_box ,   ), label:Text(data , overflow: TextOverflow.fade,) ,),

                          IconButton(onPressed: (){

                            showDialog(context: context, builder: (context)=>Padding(
                              padding: const EdgeInsets.symmetric(vertical: 220.0 , horizontal: 50),
                              child: Container(

                                child: Material(

                                  child: TextFormField(
                                    controller: _editing_controller,
                                    autofocus: true,
                                    onEditingComplete: (){
                                    setState(() {
                                      this.newDataList.remove(data);
                                      this.newDataList.add(_editing_controller.text);
                                      mainDataList.remove(data);
                                      mainDataList.add(_editing_controller.text);
                                      Navigator.pop(context);

                                    });

                                    },









                                  ),
                                ),
                              ),
                            ));

                          }, icon: Icon(Icons.edit))
                        ],
                      )

                  ),
                  onTap: ()=> print(data),);
              }).toList() : [
                TextButton.icon(onPressed: (){
                  mainDataList.add(_textController_group.text);



                }, icon: Icon(Icons.add), label: Text(_textController_group.text))
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Search bar in app bar flutter
class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => new _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  Widget appBarTitle = new Text("AppBar Title");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title:appBarTitle,
          actions: <Widget>[
            new IconButton(icon: actionIcon,onPressed:(){
              setState(() {
                if ( this.actionIcon.icon == Icons.search){
                  this.actionIcon = new Icon(Icons.close);
                  this.appBarTitle = new TextField(
                    style: new TextStyle(
                      color: Colors.white,

                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search,color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)
                    ),
                  );}
                else {
                  this.actionIcon = new Icon(Icons.search);
                  this.appBarTitle = new Text("AppBar Title");
                }


              });
            } ,),]
      ),
    );
  }
}
