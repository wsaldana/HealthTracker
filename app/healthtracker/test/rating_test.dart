import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthtracker/screens/rating.dart';
import 'package:healthtracker/screens/symptoms.dart';



void main() {


  

 testWidgets("rating num", (tester) async{
    Function(int p1) onNum;
    Function(int p1) updateValue;
    int maxNum;
    await tester.pumpWidget(MaterialApp(
    home:Rating(onNum,updateValue, maxNum = 5)),
    );
    expect(maxNum, 5);
   
  });


  testWidgets("rating buttons widget", (tester) async{
    Function(int p1) onNum;
    Function(int p1) updateValue;
    await tester.pumpWidget(MaterialApp(
    home:Rating(onNum,updateValue)),
    );

    expect(find.byIcon(Icons.circle), findsWidgets);
      });

  testWidgets("rating widget", (tester) async{
    Function(int p1) onNum;
    Function(int p1) updateValue;
    await tester.pumpWidget(MaterialApp(
    home:Symptoms()),
    );

    expect(find.text("Registrar"), findsOneWidget);
  });


  // test('if widget.maxNum is 5, do something', () {
  //   Function(int p1) onValue;
  //   Function(int p1) updateValue;
  //   final int maxNum = 5;

  //   final widget = Rating(updateValue,onValue,maxNum);
  //   final element = widget.createElement(); // this will set state.widget
  //   final state = widget.createState();
  //   expect(state.methodToBeTested(), 5);


}


