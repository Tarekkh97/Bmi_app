import 'package:flutter/material.dart';

class BmiResultPage extends StatelessWidget {
  const BmiResultPage({
    super.key,
    required this.res,
    required this.gender,
    required this.age,
  });
  final double res;
  final String gender;
  final int age;
  @override
  Widget build(BuildContext context) {
    String result = "";
    switch (res) {
      case <= 18.5:
        result = "Severe Thinness";
        break;
      case > 18.5 && < 25:
        result = "Normal";
        break;
      case > 25 && < 30:
        result = "Over Wieght";
        break;
      case > 30:
        result = "Obese";
        break;
      default:
    }
    return Scaffold(
      backgroundColor:
          gender == "Male" ? Colors.blue[300] : Colors.pink.shade400,
      appBar: _appbar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Gender : $gender",
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Age : $age",
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Result : ${res.round()}",
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.refresh_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const SizedBox(),
      title: const Text(
        "BMI RESULT",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
  }
}
