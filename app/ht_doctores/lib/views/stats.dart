import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import '../controllers/apiController.dart';

class Stats extends StatefulWidget {
  final String idPaciente;
  Stats(this.idPaciente);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {

  Future<Map<String, List<String>>> requestFeatures(id) async {
    ApiController apiController = new ApiController();
    var data = await apiController.getResumen(id);
    return data;
  }

  final List<Feature> features = [
    Feature(
      title: "Dolor de cabeza",
      color: Colors.pink,
      data: [1, 0.7, 0.5, 0.8],
    ),
    Feature(
      title: "Sangrados",
      color: Colors.blue,
      data: [0.5, 0.3, 0.7, 1],
    ),
    Feature(
      title: "Calambres",
      color: Colors.green,
      data: [0.8, 0.1, 1, 0.6],
    ),
    Feature(
      title: "Diarrea",
      color: Colors.purple,
      data: [0.4, 0.6, 0.2, 0.8],
    ),
    Feature(
      title: "Dolor de espalda",
      color: Colors.yellow,
      data: [0.1, 1, 0.3, 0.4],
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ]),
                child: Form(
                  child: Column(
                    children: [
                      Text(
                        "Estadísticas de síntomas",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      FutureBuilder<Map<String, List<String>>>(
                        future: requestFeatures(widget.idPaciente), 
                        builder: (BuildContext context, AsyncSnapshot<Map<String, List<String>>> snapshot){
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }else if(snapshot.connectionState == ConnectionState.done){
                            if(snapshot.hasData){
                              return LineGraph(
                                features: [
                                  Feature(
                                    title: "Dolor de cabeza",
                                    color: Colors.pink,
                                    data: snapshot.data["cabeza"].map((e) => double.parse(e)/5).toList(),
                                  ),
                                  Feature(
                                    title: "Sangrados",
                                    color: Colors.blue,
                                    data: snapshot.data["sangrados"].map((e) => double.parse(e)/5).toList(),
                                  ),
                                  Feature(
                                    title: "Calambres",
                                    color: Colors.green,
                                    data: snapshot.data["calambres"].map((e) => double.parse(e)/5).toList(),
                                  ),
                                  Feature(
                                    title: "Diarrea",
                                    color: Colors.purple,
                                    data: snapshot.data["diarrea"].map((e) => double.parse(e)/5).toList(),
                                  ),
                                  Feature(
                                    title: "Dolor de espalda",
                                    color: Colors.yellow,
                                    data: snapshot.data["espalda"].map((e) => double.parse(e)/5).toList(),
                                  )
                                ],
                                size: Size(400, 450),
                                labelX: snapshot.data["labels"],
                                labelY: ["1", "2", "3", "4", "5"],
                                showDescription: true,
                                graphColor: Colors.blue,
                                graphOpacity: 0.06,
                                verticalFeatureDirection: true,
                                descriptionHeight: 180,
                              );
                            }else{
                              return LineGraph(
                                features: [
                                  Feature(
                                    title: "Dolor de cabeza",
                                    color: Colors.pink,
                                    data: [1, 0.7, 0.5, 0.8],
                                  ),
                                  Feature(
                                    title: "Sangrados",
                                    color: Colors.blue,
                                    data: [0.5, 0.3, 0.7, 1],
                                  ),
                                  Feature(
                                    title: "Calambres",
                                    color: Colors.green,
                                    data: [0.8, 0.1, 1, 0.6],
                                  ),
                                  Feature(
                                    title: "Diarrea",
                                    color: Colors.purple,
                                    data: [0.4, 0.6, 0.2, 0.8],
                                  ),
                                  Feature(
                                    title: "Dolor de espalda",
                                    color: Colors.yellow,
                                    data: [0.1, 1, 0.3, 0.4],
                                  ),
                                ],
                                size: Size(400, 450),
                                labelX: ["07-20", "08-12", "08-23", "09-15"],
                                labelY: ["1", "2", "3", "4", "5"],
                                showDescription: true,
                                graphColor: Colors.blue,
                                graphOpacity: 0.06,
                                verticalFeatureDirection: true,
                                descriptionHeight: 180,
                              );
                            }
                          }else{
                            return LineGraph(
                                features: [
                                  Feature(
                                    title: "Dolor de cabeza",
                                    color: Colors.pink,
                                    data: [],
                                  ),
                                  Feature(
                                    title: "Sangrados",
                                    color: Colors.blue,
                                    data: [],
                                  ),
                                  Feature(
                                    title: "Calambres",
                                    color: Colors.green,
                                    data: [],
                                  ),
                                  Feature(
                                    title: "Diarrea",
                                    color: Colors.purple,
                                    data: [],
                                  ),
                                  Feature(
                                    title: "Dolor de espalda",
                                    color: Colors.yellow,
                                    data: [],
                                  )
                                ],
                                size: Size(400, 450),
                                labelX: [],
                                labelY: ["1", "2", "3", "4", "5"],
                                showDescription: true,
                                graphColor: Colors.blue,
                                graphOpacity: 0.06,
                                verticalFeatureDirection: true,
                                descriptionHeight: 180,
                              );
                          }
                        }
                      ),
                      /*LineGraph(
                        features: features,
                        size: Size(400, 450),
                        labelX: ["07-20", "08-12", "08-23", "09-15"],
                        labelY: ["1", "2", "3", "4", "5"],
                        showDescription: true,
                        graphColor: Colors.blue,
                        graphOpacity: 0.06,
                        verticalFeatureDirection: true,
                        descriptionHeight: 180,
                      ),*/
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
