// ignore_for_file: non_constant_identifier_names

import 'dart:math';


import 'package:Bmi_app/view/pages/result_page/bmi_result_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isMale = true;
  double heig = 120.0;
  int weig = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ///Header
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: MaleSection(),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: FemaleSection(),
                    ),
                  ],
                ),
              ),

              ///Middle
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SliderSection(),
              ),

              ///Last
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: AgeSection(),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: WeightSection(),
                    ),
                  ],
                ),
              ),

              ///Bottom
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.pink.shade400),
                  maximumSize: const MaterialStatePropertyAll(
                    Size(double.infinity, 60.0),
                  ),
                ),
                onPressed: () {
                  double result = weig / pow(heig / 100, 2).toDouble();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BmiResultPage(
                      res: result,
                      gender: isMale ? "Male" : "Female",
                      age: age,
                    ),
                  ));
                },
                child: const Center(
                  child: Text(
                    "CALCULATOR",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector FemaleSection() {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            isMale = false;
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isMale ? Colors.transparent : Colors.pink.shade400,
            width: 3,
          ),
          color: Colors.blue[300],

          // color: const Color.fromARGB(73, 158, 158, 158),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.female,
              size: 80,
              color: Colors.white,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Female",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector MaleSection() {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            isMale = true;
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isMale ? Colors.pink.shade400 : Colors.transparent,
            width: 3,
          ),
          // color: const Color.fromARGB(73, 158, 158, 158),
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.male,
              size: 80,
              color: Colors.white,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Male",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container WeightSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[300],

        // color: const Color.fromARGB(73, 158, 158, 158),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Weight",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$weig",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    weig++;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.pink[400],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    weig--;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.pink[400],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container AgeSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[300],

        // color: const Color.fromARGB(73, 158, 158, 158),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Age",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$age",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    age++;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.pink[400],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    age--;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.pink[400],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container SliderSection() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue[300],

        // color: const Color.fromARGB(73, 158, 158, 158),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Height",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "${heig.round()}",
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              const Text(
                "cm",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Slider(
            value: heig,
            max: 220.0,
            min: 80.0,
            activeColor: Colors.pink[400],
            inactiveColor: Colors.white54,
            onChanged: (value) {
              setState(() {
                heig = value;
              });
            },
          ),
        ],
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "BMI CALCULATOR",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      centerTitle: true,
    );
  }
}
