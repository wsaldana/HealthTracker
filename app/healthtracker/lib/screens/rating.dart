import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final Function(int) updateValue;
  final int maxNum;
  final Function(int) onNum;

  Rating(this.updateValue, this.onNum, [this.maxNum = 5]);

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
      return GestureDetector(
        child: _buildRating(index),
        onTap: () {
          setState(() {
            _current = index + 1;
          });
          print(index);
          this.widget.updateValue(_current);
          this.widget.onNum(_current);
        },
      );
    });

    return Row(children: num, mainAxisAlignment: MainAxisAlignment.spaceEvenly);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
