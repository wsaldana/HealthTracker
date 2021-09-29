import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Stats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatsState();
  }
}

class Datos {
  int _rating = 0;
  int _sangrados = 0;
  int _calambres = 0;
  int _diarrea = 0;
  int _espalda = 0;
  int _cabeza = 0;
  String _fecha;
  String colorVal;
  Datos(this._cabeza, this._calambres, this._diarrea, this._espalda,
      this._rating, this._sangrados, this._fecha, this.colorVal);

  Datos.fromMap(Map<String, dynamic> map)
      : assert(map['_rating'] != null),
        assert(map['_sangrados'] != null),
        assert(map['_calambres'] != null),
        assert(map['_diarrea'] != null),
        assert(map['_espalda'] != null),
        assert(map['_cabeza'] != null),
        assert(map['_fecha'] != null),
        assert(map['colorVal'] != null);
}

class _StatsState extends State<Stats> {
  // datos de sintomas
  List<charts.Series<Datos, String>> _seriesBarData;
  List<Datos> myData;
  _generateData(myData) {
    _seriesBarData.add(charts.Series(
        domainFn: (Datos datos, _) => datos._fecha, // eje x
        measureFn: (Datos datos, _) => datos._cabeza, // eje y
        colorFn: (Datos datos, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(datos.colorVal))),
        id: 'Datos',
        data: myData,
        labelAccessorFn: (Datos row, _) => "${row._fecha}"));
  }

  @override
  Widget build(BuildContext context) {
    List<Datos> datos;
    return Scaffold(
      appBar: AppBar(title: Text('Estadísticas')),
      body: _buildChart(context, datos),
    );
  }

  Widget _buildChart(BuildContext context, List<Datos> datos) {
    myData = datos;
    _generateData(myData);
    // se crea la grafica
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Registro de síntomas',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: charts.BarChart(
                _seriesBarData,
                animate: true,
                animationDuration: Duration(seconds: 5),
                behaviors: [
                  new charts.DatumLegend(
                    entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 18),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
