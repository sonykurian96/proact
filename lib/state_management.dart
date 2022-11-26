import 'package:get/get.dart';

class Questions {
  var commonQuestions = Rx<List<String>>([]);
  var commonResponses = Rx<List<String>>([]);

  var selectedIndex = Rx<int>(0);

  void putCommonQuestions(String value) {
    commonQuestions.value.add(value);
  }

  void putCommonResponses(String value) {
    commonResponses.value.add(value);
  }
}

class SpecificQuestions {
  var specificQuestions = Rx<List<String>>([]);
  var specificResponses = Rx<List<String>>([]);

  var questionNo = Rx<int>(0);

  var selectedIndex = Rx<int>(0);

  void putspecificQuestions(String value) {
    specificQuestions.value.add(value);
  }

  void putspecificResponses(String value) {
    specificResponses.value.add(value);
  }
}
