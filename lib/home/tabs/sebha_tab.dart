import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTab();
}
class _SebhaTab extends State<SebhaTab> {
  List<String> azkarList = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
  ];
  double _rotationAngle = 0.0;
  String text = 'سبحان الله';
  int counter = 0;
  int currentZikrIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      onMasbahaClicked();
                      _rotationAngle += 135;
                    });
                  },
                  child: Transform.rotate(
                    angle: _rotationAngle * (3.1415926535 / 180),
                    child: Image.asset(
                      'assets/images/body of seb7a.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Image.asset('assets/images/head of seb7a.png'),
              ),
            ],
          ),
          const Text(
            'عدد التسبيحات',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 81,
            width: 69,
            decoration: BoxDecoration(
              color: const Color(0xffc9b396),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                counter.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 51,
            width: 137,
            decoration: BoxDecoration(
              color: const Color(0xffB7935F),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onMasbahaClicked() {
    if (counter < 33) {
      counter++;
    }
    else {
      counter = 0;
      currentZikrIndex = (currentZikrIndex + 1) % azkarList.length;
      text = azkarList[currentZikrIndex];
    }
  }
}
