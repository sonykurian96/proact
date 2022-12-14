import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:proact/backend.dart';
import 'package:proact/result.dart';
import 'package:proact/state_management.dart';

import 'second_page.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Questions questions = Get.put(Questions());
  SpecificQuestions specificQuestionsList = Get.put(SpecificQuestions());

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Questions questions = Get.find();

  int count = 0;

  @override
  void initState() {
    displayCommonQuestions();
    super.initState();
  }

  List<int> a_list = [];

  List<int> no_of_options = [5, 5, 6, 4, 3, 3, 4, 4, 4];

  int? selectedIndex;
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
                    questions.commonQuestions.value[count],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: no_of_options[count],
                    itemBuilder: (context, index) {
                      return OptionCard(
                          questions.commonResponses.value[questions
                                  .commonResponses.value
                                  .indexOf("${count + 1}") +
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
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_back_ios_new),),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count = count + 1;
                      selectedIndex = null;
                    });
                    if (count > 8) {
                      calculate_score_of_commonQuestions(a_list);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return SecondPage();
                          },
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    child:Icon(Icons.arrow_forward_ios),
                ))
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
        a_list.add(itemIndex);
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
