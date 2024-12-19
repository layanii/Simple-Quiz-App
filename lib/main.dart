import 'package:flutter/material.dart';
import 'package:task4/question.dart';
//import 'dart:ui';

//import 'package:flutter_app';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var indexu = 0;
  List<Icon> scores = [];

  List<Question> qustiones = [
    Question("A group of crocodiles are called shrewdness ?", false),
    Question("Dogs can understand up to 250 hand gestures ?", true),
    Question("A hair of a polar bear's fur is white ?", false),
    Question(
        "The Indian elephant is larger than the African elephant ?", false),
    Question("A snail can sleep for up to 3 months ?", false),
    Question("Apes cannot laugh ?", false),
    Question("Penguins cant be found on the continent of Africa ?", false),
    Question("The Amazon River has native dolphins ?", true),
    Question("A slug has four noses ?", true),
    Question("A Peregrine Falcon is the fastest bird in the world ?", true),
  ];

  String getq(var index) {
    var question = qustiones[index].questionText;
    return question;
  }

  bool getA(var index) {
    bool ansewr = qustiones[index].questionAnsewr;
    return ansewr;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF292828),
        body: showBody(),
      ),
    );
  }

  Column showBody() {
    if (indexu < qustiones.length) {
      return Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  getq(indexu),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (getA(indexu) == true) {
                    scores.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scores.add(Icon(
                      Icons.clear,
                      color: Colors.red,
                    ));
                  }
                  indexu++;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 120,
                color: Colors.green,
                child: const Text("true"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (getA(indexu) == false) {
                    scores.add(const Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scores.add(Icon(
                      Icons.clear,
                      color: Colors.red,
                    ));
                  }
                  indexu++;
                  //scores.add(value);
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 120.0,
                color: Colors.red,
                child: const Text("false"),
              ),
            ),
          ),
          Row(
            children: scores,
          )
        ],
      );
    } else {
      return const Column(
        children: [
          Expanded(
              child: Center(
            child: Text(
              "No more qustiones",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),
          )),
        ],
      );
    }
    // return Column(
    //   children: [
    //     Row(
    //       children: scores,
    //     )
    //   ],
    // );
  }
}
