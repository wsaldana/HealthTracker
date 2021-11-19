import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';


class Register_med extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
        
        child: Image(
          image: NetworkImage('https://i.pinimg.com/originals/d3/f9/13/d3f913b8dd27fac04b26c2c9a903610d.png'),
        ),
      ),
      appBar: AppBar(
        title: Text("Seleccionar médico", textScaleFactor: 1.15,),
        toolbarHeight: 90,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },)
        ],
      ),
      drawer: Drawer(),
        
    );
  }
}
class DataSearch extends SearchDelegate<String> {
  final meds = [
    "Dr. Manuel Mursch",
    "Dr. Sawyer Villamayor",
    "Dr. Enzo Vernetti",
    "Dr. Earl Marazas",
    "Dr. Gabriela Klun",
    "Dr. Camille Figueras",
    "Dr. Elsie Goudy",
    "Dr. Alondra Densmore",
    "Dr. Carol Anreozzi"
  ];
  final r_meds = [
    
  ];
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [ 
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })
    ];
  }
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation), onPressed: (){
        close(context, null);
      },
      );

  }
  @override
  Widget buildResults(BuildContext context) {
    // aca se pasaría a la siguiente página 
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty?r_meds:meds.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading:  Icon(Icons.person),
        title: RichText(text: TextSpan(
          text: suggestions[index].substring(0, query.length),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: [TextSpan(
            text: suggestions[index].substring(query.length),
            style: TextStyle(color: Colors.grey)
        )]
      )),
      ),

      itemCount: suggestions.length,
    );

  }

}