import 'package:get/get.dart';
import 'package:proact/state_management.dart';

class Score {
  int score = 0;
  String diseases = "";
  int diseasesID = -1;

  Score(this.score, this.diseases, this.diseasesID);
}

class Node {
  String questionID = "";
  String question = "";
  bool result = false;

  List<List<int>> scores = [];
  var responses = <String>[];

  Node(this.questionID, this.question, this.responses, this.scores) {
    if (responses.isEmpty) {
      result = true;
    }
  }
}

void backend() async {
  print("program started");

  Questions questions = Get.find();

  List<Node> commonQuestions = [
    Node("1", "Age category", [
      "20-30",
      "30-40",
      "40-50",
      "50-60",
      "60+"
    ], [
      [],
      [],
      [],
      [0, 0, 1, 1, 1]
    ]),
    Node("1", "BMI category:", [
      "<18",
      "18.5-24",
      "24-30",
      "30-36",
      ">36"
    ], [
      [-1, -1, 2, 2, 2],
      [],
      [],
      [0, 0, 2, 2, 2]
    ]),
    Node("1", "Do you feel any of the following?", [
      "Fever",
      "Frequent headaches",
      "Tiredness/Fatigue",
      "Nausea/Fainting",
      "Vomiting",
      "None"
    ], [
      [-1, 1, -1, -1, -1, -1],
      [0, 0, 1, 1, 1, -1]
    ]),
    Node("1", "Select temperature range of fever", [
      "No fever",
      "98F to 100F",
      "100F to 101F",
      ">101F"
    ], [
      [],
      [-2, -2, -2, 6]
    ]),
    Node("1", "Have you noticed the recent change in weight?", [
      "No significant change",
      "Sudden weight gain",
      "Sudden weight loss"
    ], [
      [-2, 3, -2],
      [],
      [],
      [0, 0, 4]
    ]),
    Node("1", "How regular is menstrual flow?", [
      "No irregularities",
      "Missed periods",
      "Periods too frequent"
    ], [
      [0, 2, 2]
    ]),
    Node(
        "1", "Do you face any of the following problems during your periods?", [
      "Excessive blood loss",
      "Painful periods",
      "White/Yellow/gray smelly discharge from vagina",
      "Bleeding between periods"
    ], [
      [],
      [-2, 2, -2, -2],
      [2, 2, 2, 2]
    ]),
    Node("1", "Hereditary", [
      "PCOS",
      "PID",
      "Ovarian Cancer",
      "Chlamydia"
    ], [
      [8],
      [],
      [],
      [6]
    ]),
    Node("1", "Are you facing any of the following symptoms", [
      "Frequent / painful urination",
      "Lower abdominal pain",
      "Pain/Bleeding during/after intercourse",
      "None"
    ], [
      [],
      [2, 2, 2, -2]
    ])
  ];

  List<List<Node>> specificQuestions = [
//     PCOS
    [
      Node("1", "Are you facing one or more of the following symptoms?", [
        "Excess thirst and hunger",
        "Blurred vision",
        "Unexplained weight loss",
        "None"
      ], [
        [1, 1, 1, -1]
      ]),
      Node("1", "Heavy menstrual flow during periods", [
        "Yes",
        "No"
      ], [
        [4, 0]
      ]),
      Node("3", "Do you experience one or more of the following", [
        "Frequent / painful urination",
        "Lower abdominal pain",
        "Pain during sex",
        "None"
      ], [
        [1, 2, 3, -2]
      ]),
      Node("4", " Are you noticing any of the following", [
        "Facial / body hair",
        "Hair thinning / Male pattern baldness",
        "Acne / oily skin",
        "Excess skin growth on neck or armpits",
        "None"
      ], [
        [8, 7, 1, 5, 0]
      ]),
      Node(
          "1", " Are you noticing dark patches of skin in following regions:", [
        "Behind the neck",
        "Under armpits",
        "Under breasts",
        "None of the above"
      ], [
        [4, 4, 4, -2]
      ])
    ],

//     PID
    [
      Node("1", "Vaginal discharge", [
        "Yes",
        "No"
      ], [
        [],
        [2, -2]
      ]),
      Node("1", "Have you recently been diagnosed with any std?", [
        "Yes",
        "No"
      ], [
        [],
        [6, -2]
      ]),
      Node("1", "Have you had the following recently:", [
        "Damage to cervix due to miscarriage",
        "Abortion",
        "Inspection of womb",
        "Insertion of Intrauterine device",
        "None"
      ], [
        [],
        [5, 4, 2, 2, -3]
      ])
    ],
//   Chlaymydia
    [
      Node(
          "1",
          " Do you have a history of having sex with multiple partners recently",
          [
            "Yes",
            "No"
          ],
          [
            [],
            [],
            [6, -3]
          ]),
      Node("1", " Have you recently had intercourse with a new partner", [
        "Yes",
        "No"
      ], [
        [],
        [],
        [3, -2]
      ]),
      Node("1",
          "Do you use barrier method or have undergone vasectomy/tubectomy", [
        "Yes",
        "No"
      ], [
        [],
        [],
        [-1, 5]
      ]),
      Node("1", "Do you experience any of the following symptoms", [
        "Pain or Burning sensation while peeing",
        "Itching or burning around the vagina",
        "Increased need to pee",
        "Pus in urine",
        "None"
      ], [
        [],
        [],
        [3, 1, 1, 4, -2]
      ]),
      Node(
          "1",
          "Have you come in sexual contact with a STD diagnosed person in past 3 months?",
          [
            "Yes",
            "No"
          ],
          [
            [],
            [],
            [7, 0]
          ]),
      Node("1",
          " Have you noticed the following symptoms in the Rectum region?", [
        "Bleeding",
        "Rectal pain",
        "Rectal discharge",
        "None"
      ], [
        [],
        [],
        [5, 3, 4, -2]
      ]),
      Node("1", " Have you noticed", [
        "Inflammation of cervix",
        "Lower abdominal pain",
        "Pelvic pain",
        "None"
      ], [
        [],
        [],
        [4, 3, 3, -2]
      ])
    ],
//   Ovarian Cancer
    [
      Node("1", "Have you ever done the following", [
        "Birth Control Pills",
        "Being Pregnant",
        "Breast feeding",
        "None"
      ], [
        [],
        [],
        [],
        [-3, -3, -1, 4]
      ]),
      Node("1", "Specify your age in years when menstruation started ", [
        "Before 10",
        "10-12",
        "12-14",
        "After 14"
      ], [
        [],
        [],
        [],
        [3, -1, -1, -1]
      ]),
      Node("1", "Specify age in years when menopause began, if it has", [
        "Not begun yet",
        "Less than 45",
        "45-50",
        "50-55",
        "After 55"
      ], [
        [],
        [],
        [],
        [-1, -1, -1, 3]
      ]),
      Node("1", "Have you noticed the following in your abdomen/pelvic area", [
        "Pain",
        "Swelling",
        "Feeling pressure in abdomen/pelvis",
        "Lump in pelvic region",
        "None"
      ], [
        [],
        [],
        [],
        [2, 3, 3, 7, -3]
      ]),
      Node("1", "Do you recently feel:", [
        "Sudden/Frequent urge to urinate",
        "Trouble eating or feeling full quickly",
        "Gastrointestinal problems / Constipation",
        "None"
      ], [
        [],
        [],
        [],
        [2, 3, 4, -2]
      ]),
      Node("1", "Are you facing", [
        "Fatigue",
        "Back pain",
        "None"
      ], [
        [],
        [],
        [],
        [2, 2, -1]
      ]),
      Node(
          "1",
          "Which of the following (if any) constitute a high proportion of your diet",
          [
            "Fruits and vegetables",
            "Whole Grains",
            "Sugary Drinks",
            "Processed Foods",
            "None"
          ],
          [
            [],
            [],
            [],
            [-1, -1, 1, 1, 0]
          ])
    ],
  ];

  List<Score> scores = [
    Score(0, "PCOS", 0),
    Score(0, "PID", 1),
    Score(0, "Chylmedia", 2),
    Score(0, "Ovarian Cancer", 3)
  ];
  List<int> options = [7, 2, 5, 67, 37, 23];
  int idx = 0;

  int qNo = 1;
  for (var ques in commonQuestions) {
    int i = 0;
    print(ques.question);
    questions.putCommonQuestions(ques.question);

    questions.putCommonResponses("$qNo");
    for (var opt in ques.responses) {
      print("Select $i for $opt");
      questions.putCommonResponses(opt);
      i++;
    }
    qNo = qNo + 1;

    dynamic selectedOption;
    if (questions.selectedIndex.value == 0) {
      selectedOption = await questions.selectedIndex.value;
    }

    print("Selecting $selectedOption ");
    for (int j = 0; j < ques.scores.length; j++) {
      if (ques.scores[j].length >= selectedOption + 1) {
        scores[j].score += ques.scores[j][selectedOption];
      }
    }
    idx++;
    idx %= options.length;
    print(" ");
  }

  for (var i in scores) {
    print("${i.score} for ${i.diseases}");
  }
  print("");

  scores.sort((a, b) => b.score.compareTo(a.score));
  for (var i in scores) {
    print("${i.score} for ${i.diseases}");
  }
  idx = 0;
  List<List<int>> index = [];

  for (var i in specificQuestions) {
    index.add([0, i.length]);
  }
  for (int x = 0; x < 2; x++) {
    while (index[scores[x].diseasesID][0] < index[scores[x].diseasesID][1]) {
      var ques = specificQuestions[scores[x].diseasesID]
          [index[scores[x].diseasesID][0]];
      int i = 0;

      print(ques.question);

      for (var opt in ques.responses) {
        print("Select $i for $opt");
        i++;
      }
      int selectedOption = options[idx] % ques.responses.length;
      print("Selecting $selectedOption ");
      for (int j = 0; j < ques.scores.length; j++) {
        if (ques.scores[j].length >= selectedOption + 1) {
          for (var k in scores) {
            if (k.diseasesID == j) k.score += ques.scores[j][selectedOption];
          }
        }
      }
      idx++;
      idx %= options.length;
      print(" ");

      index[scores[x].diseasesID][0]++;
      scores.sort((a, b) => b.score.compareTo(a.score));
    }
  }

  if (scores[0].score > 5) {
    print("You may have ${scores[0].diseases}");
  } else {
    print("Good news, you have none !");
  }

  for (String i in questions.commonQuestions.value) {
    print("this actually works, the questions -> " + i);
  }
  for (String i in questions.commonResponses.value) {
    print("this actually works, the responses -> " + i);
  }
}
