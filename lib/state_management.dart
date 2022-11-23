import 'package:get/get.dart';

class Questions {
  var commonQuestions = Rx<List<String>>([""]);
  var commonResponses = Rx<List<String>>([""]);

  var selectedIndex = Rx<int>(0);

  void putCommonQuestions(String value) {
    commonQuestions.value.add(value);
  }

  void putCommonResponses(String value) {
    commonResponses.value.add(value);
  }

  
}
