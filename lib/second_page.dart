import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proact/backend.dart';
import 'package:proact/state_management.dart';

import 'result.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SpecificQuestions questions = Get.find();

  int count = 1;

  @override
  void initState() {
    displaySpecificQuestions();
    super.initState();
  }

  List<int> b_list = [];

  List<int> no_of_options = [5, 5, 6, 4, 3, 3, 4, 4, 4];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
                Flexible(
                  child: Text(
                    specificQuestionsList.specificQuestions.value[count - 1],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: (specificQuestionsList.specificResponses.value
                            .indexOf("${count + 1}") -
                        specificQuestionsList.specificResponses.value
                            .indexOf("${count}") -
                        1),
                    itemBuilder: (context, index) {
                      return OptionCard(
                          specificQuestionsList.specificResponses.value[
                              specificQuestionsList.specificResponses.value
                                      .indexOf("${count}") +
                                  1 +
                                  index],
                          index);
                    }),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      count = count - 1;
                      selectedIndex = null;
                    });
                  },
                  child: Container(
                    child: Icon(Icons.arrow_back_ios_new),
                    width: 50,
                    height: 50,
                  ),
                ),
                InkWell(
                  child: Container(
                    child: Icon(Icons.arrow_forward_ios),
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    setState(() {
                      count = count + 1;
                      selectedIndex = null;
                    });
                    print(
                        "questionNo is ${specificQuestionsList.questionNo.value}");
                    if (count > specificQuestionsList.questionNo.value - 1) {
                      print("bcskcbksdvbsdkvbdskvsdvs");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return ResultPage();
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget OptionCard(String text, int itemIndex) {
    return InkWell(
      onTap: () {
        b_list.add(itemIndex);
        print("this index is tapped $itemIndex");
        setState(() {
          selectedIndex = itemIndex;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 300,
              height: 50,
              child: Card(
                color: selectedIndex == itemIndex ? Colors.red : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        Icons.touch_app_outlined,
                        color: selectedIndex == itemIndex ? Colors.white : null,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Text(
                          text,
                          style: TextStyle(
                            color: selectedIndex == itemIndex
                                ? Colors.white
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
