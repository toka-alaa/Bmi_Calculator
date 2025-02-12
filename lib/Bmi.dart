import 'dart:math';
import 'package:flutter/material.dart';
import 'Result.dart';


class Bmi extends StatefulWidget {
  const Bmi({super.key});
  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  bool isMale = true;
  double height = 150;
  int weight = 50;
  int age = 10;
  Color? clr1 = Colors.amber[100];
  Color? clr2 = Colors.amber[100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    clr1 = Colors.pink[100];
                    clr2 = Colors.amber[100];
                  });
                },
                child: Container(
                  color: clr1,
                  width: 150,
                  height: 150,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        size: 50.0,
                      ),
                      Text(
                        "Female",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    clr2 = Colors.blue[100];
                    clr1 = Colors.amber[100];
                  });
                },
                child: Container(
                  color: clr2,
                  width: 150,
                  height: 150,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 50.0,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.amber[100],
            width: 330,
            height: 150,
            child: Column(
              spacing: 10,
              children: [
                const Text(
                  "Height",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${height.round()}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "cm",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Slider(
                  inactiveColor: Colors.grey,
                  thumbColor: Colors.black,
                  value: height,
                  activeColor: Colors.black,
                  onChanged: (v) {
                    setState(() {
                      height = v;
                    });
                  },
                  min: 100,
                  max: 250,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.amber[100],
                width: 150,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Weight",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "${weight.round()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          icon: Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.amber[100],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            icon:  Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.amber[100],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.amber[100],
                width: 150,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Age",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "${age.round()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          icon:  Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.amber[100],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            icon:  Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.amber[100],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          MaterialButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      result: result,
                      age: age,
                      isMale: isMale,
                    ),
                  ),
                );
              },
              color: Colors.amber[100],
              child: const Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ))
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}