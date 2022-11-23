import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "ProAct",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        ),
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
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(300))
                      ),
                    ),
                  ),
                ),
                Text(
                  "Results",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15,),
                Text(
                  "You are fine!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
