import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
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
                      LineGraph(
                        features: features,
                        size: Size(400, 450),
                        showDescription: true,
                        graphColor: Colors.blue,
                        graphOpacity: 0.06,
                        verticalFeatureDirection: true,
                        descriptionHeight: 180,
                      ),
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
