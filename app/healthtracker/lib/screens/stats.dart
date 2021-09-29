import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:intl/intl.dart';

class Stats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatsState();
  }
}

class Datos {
  int sangrados;
  int calambres;
  int diarrea;
  int espalda;
  int cabeza;
  // DateTime fecha;
  String fecha;
  charts.Color colorVal;
  Datos(
      {this.cabeza,
      this.calambres,
      this.diarrea,
      this.espalda,
      this.sangrados,
      this.fecha,
      this.colorVal});
}

class Chart extends StatelessWidget {
  final List<Datos> datos;
  Chart({this.datos});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Datos, String>> series = [
      charts.Series(
          // DateFormat("yyyy-MM-dd").format(DateTime.now()
          id: "cabeza",
          data: datos,
          domainFn: (Datos datos, _) => datos.fecha.toString(), // eje x
          measureFn: (Datos datos, _) => datos.cabeza,
          labelAccessorFn: (Datos row, _) => "${row.fecha}",
          colorFn: (Datos datos, _) => datos.colorVal),
      charts.Series(
          // DateFormat("yyyy-MM-dd").format(DateTime.now()
          id: "espalda",
          data: datos,
          domainFn: (Datos datos, _) => datos.fecha.toString(), // eje x
          measureFn: (Datos datos, _) => datos.espalda,
          labelAccessorFn: (Datos row, _) => "${row.fecha}",
          colorFn: (Datos datos, _) => datos.colorVal),
      charts.Series(
          // DateFormat("yyyy-MM-dd").format(DateTime.now()
          id: "sangrado",
          data: datos,
          domainFn: (Datos datos, _) => datos.fecha.toString(), // eje x
          measureFn: (Datos datos, _) => datos.sangrados,
          labelAccessorFn: (Datos row, _) => "${row.sangrados}",
          colorFn: (Datos datos, _) => datos.colorVal),
      charts.Series(
          // DateFormat("yyyy-MM-dd").format(DateTime.now()
          id: "diarrea",
          data: datos,
          domainFn: (Datos datos, _) => datos.fecha.toString(), // eje x
          measureFn: (Datos datos, _) => datos.diarrea,
          labelAccessorFn: (Datos row, _) => "${row.diarrea}",
          colorFn: (Datos datos, _) => datos.colorVal),
      charts.Series(
          // DateFormat("yyyy-MM-dd").format(DateTime.now()
          id: "calambres",
          data: datos,
          domainFn: (Datos datos, _) => datos.fecha.toString(), // eje x
          measureFn: (Datos datos, _) => datos.calambres,
          labelAccessorFn: (Datos row, _) => "${row.calambres}",
          colorFn: (Datos datos, _) => datos.colorVal),
    ];

    return Container(
      height: 300,
      padding: EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                "Estadísticas de síntomas",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _StatsState extends State<Stats> {
  final List<Datos> datos = [
    Datos(
        cabeza: 3,
        calambres: 4,
        diarrea: 5,
        espalda: 2,
        sangrados: 1,
        // fecha: DateFormat("yyyy-MM-dd").parse("2021-07-20"),
        fecha: "2021-07-20",
        colorVal: charts.ColorUtil.fromDartColor(Colors.green)),
    Datos(
        cabeza: 2,
        calambres: 1,
        diarrea: 1,
        espalda: 2,
        sangrados: 3,
        // fecha: DateFormat("yyyy-MM-dd").parse("2021-08-12"),
        fecha: "2021-08-12",
        colorVal: charts.ColorUtil.fromDartColor(Colors.orange)),
    Datos(
        cabeza: 3,
        calambres: 2,
        diarrea: 4,
        espalda: 5,
        sangrados: 1,
        // fecha: DateFormat("yyyy-MM-dd").parse("2021-08-23"),
        fecha: "2021-08-23",
        colorVal: charts.ColorUtil.fromDartColor(Colors.red)),
    Datos(
        cabeza: 3,
        calambres: 5,
        diarrea: 5,
        espalda: 5,
        sangrados: 2,
        // fecha: DateFormat("yyyy-MM-dd").parse("2021-09-15"),
        fecha: "2021-09-15",
        colorVal: charts.ColorUtil.fromDartColor(Colors.blue))
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Chart(
        datos: datos,
      )),
    );
  }
}
