import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final int valor;
  final int maxNum;

  Rating(this.valor, [this.maxNum = 5]);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  int _current = 0;

  Widget _buildRating(int index) {
    if (index < _current) {
      return Icon(Icons.circle, color: Theme.of(context).accentColor);
    } else {
      return Icon(Icons.circle);
    }
  }

  Widget _buildBody() {
    final num = List<Widget>.generate(this.widget.maxNum, (index) {
      setState(() {
        _current = this.widget.valor;
      });
      return GestureDetector(
        child: _buildRating(index),
      );
    });

    return Row(children: num, mainAxisAlignment: MainAxisAlignment.spaceEvenly);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
