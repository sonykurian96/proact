import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "ProAct",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.red,
                  child: SizedBox(
                    height: height / 4,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0, color: Colors.white),
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(300))),
                    ),
                  ),
                ),
                Text(
                  "Results",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "You have high chance of PCOS",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            child: Text(
              "Your session ID is ${Random().nextInt(900000) + 100000}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            right: 20,
            top: 20,
          ),
          Positioned(
            top: height / 2,
            left: width / 6,
            child: Text(
                "You may contact these doctors for further consultation :",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Positioned(
            child: Text(
                "Dr Richa Sharma (Dermatologist):-\n+91 93505 24848,\nTwacha Skin Clinic,Dwarka,New Delhi"),
                top: height / 2 + 30,
            left: width / 6,
          ),
          Positioned(
            top: height / 1.60,
            left: width / 6,
            child: Text(
                "Dr Kiranjeet Kaur(Obstetrics and Gynaecology)-\n+91 98112 53669,\nMax Hospital,Saket,New Delhi"),
          ),
          Positioned(
            top: height / 1.40,
            left: width / 6,
            child: Text(
                "Dr Bandana Sodhi(Gyanecologist/Pregnancy Specialist)-\n+91 98112 53669,\nMoolchand Hospital,Lajpat Nagar (New Delhi)"),
          ),
        ],
      ),
    );
  }
}
