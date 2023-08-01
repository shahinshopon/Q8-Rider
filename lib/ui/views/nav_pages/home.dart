import 'dart:async';
import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/widgets/custom_button.dart';
import 'package:practice/ui/widgets/custom_text.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "How fast do you process information?",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.green),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                            'As soon as you start the test, you will see individual characters. Find them as quickly as possible in the character box below and click/tap on them. In the first run you are looking for numbers, in the second you are looking for letters. This test takes about 2 minutes (1 minute per run).'),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton("START TEST", () {
                    Get.toNamed(number);
                  })
                ],
              ),
            )),
      ),
    );
  }
}

class NumberTestScreen extends StatefulWidget {
  const NumberTestScreen({super.key});

  @override
  State<NumberTestScreen> createState() => _NumberTestScreenState();
}

class _NumberTestScreenState extends State<NumberTestScreen> {
  List<int> numberList = [];
  var number;
  var rightAnswer = 0;
  generateRandomNumber() {
    numberList.clear();
    Random random = Random();
    for (var i = 1; i < 41; i++) {
      int randomNumber = random.nextInt(41);
      if (!numberList.contains(randomNumber)) {
        if (randomNumber == 0) {
          i--;
        } else {
          numberList.add(randomNumber);
        }
      } else {
        i--;
      }
    }
  }

  generateSingleNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(26);
    number = randomNumber + 1;
  }

  final box = GetStorage();

  Timer? timer;
  @override
  void initState() {
    generateRandomNumber();
    generateSingleNumber();

    timer = Timer(const Duration(seconds: 60), () {
      box.write('number', '$rightAnswer');
      Get.offNamed(next);
    });
    super.initState();
  }

  @override
  void dispose() {
    print('called');
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Hits : $rightAnswer',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [closeButton(0)],
      ),
      body: numberList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.green)),
                      child: Center(
                          child: Text(
                        number.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GridView.builder(
                      itemCount: numberList.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              childAspectRatio: 1.2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(50),
                          splashColor: number == numberList[index]
                              ? Colors.green
                              : Colors.transparent,
                          onTap: () {
                            if (number == numberList[index]) {
                              // print('yes');

                              numberList.clear();
                              generateRandomNumber();
                              generateSingleNumber();

                              rightAnswer++;
                              setState(() {});
                              //Get.toNamed(next);
                            } else {
                              // print('no');
                            }
                          },
                          child: (numberList[index] > 26)
                              ? Container()
                              : Container(
                                  decoration: BoxDecoration(
                                      // color: Colors.green,
                                      border: Border.all(
                                          width: 3, color: Colors.amber),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: Text(
                                    numberList[index].toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ))),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}

class ContinueWithLettersScreen extends StatefulWidget {
  const ContinueWithLettersScreen({super.key});

  @override
  State<ContinueWithLettersScreen> createState() =>
      _ContinueWithLettersScreenState();
}

class _ContinueWithLettersScreenState extends State<ContinueWithLettersScreen> {
  Timer? t;
  @override
  void initState() {
    t = Timer(const Duration(seconds: 2), () {
      Get.offNamed(letter);
    });
    super.initState();
  }

  @override
  void dispose() {
    print('called from continue with letters');
    t!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text("Let's continues with letters"),
                )),
          )),
    );
  }
}

class LetterTestScreen extends StatefulWidget {
  const LetterTestScreen({super.key});

  @override
  State<LetterTestScreen> createState() => _LetterTestScreenState();
}

class _LetterTestScreenState extends State<LetterTestScreen> {
  var letterList;
  var letter = '';
  var rightAnswer = 0;

  var randomString = '';
  generateRandomLetter() {
    randomString = '';
    final random = Random();
    const allChars = 'AaBbCcDdEeFGHIJKLMNOPQRSTUVWXYZ123456789';

    for (var i = 1; i < 41; i++) {
      final a = allChars[random.nextInt(allChars.length)];
      if (randomString.contains(a)) {
        i--;
      } else {
        randomString = randomString + a;
      }
    }
  }

  generateSingleLetter() {
    letter = '';
    final _rnd = Random();
    const _chars = 'ABCDMNOPQRSTUVWXYZEFGHIJKL';

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    letter = getRandomString(1);
  }

  Timer? timer;
  final box = GetStorage();
  @override
  void initState() {
    generateRandomLetter();
    generateSingleLetter();
    timer = Timer(const Duration(seconds: 60), () {
      box.write('letter', '$rightAnswer');
      Get.offNamed(firstStepresult);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Hits : $rightAnswer',
          style: const TextStyle(color: Colors.black),
        ),
        actions: [closeButton(0)],
      ),
      body: Column(
        children: [
          //  const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.green)),
                child: Center(
                    child: Text(
                  letter,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ))),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GridView.builder(
                itemCount: randomString.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(50),
                    splashColor: letter == randomString[index]
                        ? Colors.green
                        : Colors.transparent,
                    onTap: () {
                      if (letter == randomString[index]) {
                        print('yes');

                        //letterList.clear();
                        generateRandomLetter();
                        generateSingleLetter();

                        rightAnswer++;
                        setState(() {});
                        //Get.toNamed(next);
                      } else {
                        print('no');
                      }
                    },
                    child: randomString[index].contains(RegExp(r'[A-Z]'))
                        ? Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.amber),
                                shape: BoxShape.circle),
                            child: Center(
                                child: Text(
                              randomString[index].toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            )))
                        : Container(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class FirstSecondStepResult extends StatefulWidget {
  const FirstSecondStepResult({super.key});

  @override
  State<FirstSecondStepResult> createState() => _FirstSecondStepResultState();
}

class _FirstSecondStepResultState extends State<FirstSecondStepResult> {
  final box = GetStorage();
  var numberResult;
  var letterResult;
  @override
  void initState() {
    var a = box.read('number') ?? 0;
    var b = box.read('letter') ?? 0;
    numberResult = int.parse(a);
    letterResult = int.parse(b);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [closeButton(0)],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "How fast do you process information?",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text.rich(TextSpan(children: [
                            const TextSpan(text: 'You found '),
                            TextSpan(
                                text: '$numberResult',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const TextSpan(text: ' numbers and '),
                            TextSpan(
                                text: '$letterResult',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const TextSpan(text: ' letters .'),
                          ])),
                          // Text(
                          //     "You found $numberResult numbers and $letterResult letters ."),
                          (numberResult + letterResult < 5)
                              ? const Text(
                                  " Probably today is not your day for this test")
                              : (numberResult + letterResult > 10)
                                  ? const Text('Good')
                                  : const Text("Try to better"),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                customButton("CONTINUE TO THE NEXT TEST", () {
                  Get.offNamed(rulesOfBarinGame);
                })
              ],
            ),
          )),
    );
  }
}

class RulesOfMemoryGame extends StatefulWidget {
  const RulesOfMemoryGame({super.key});

  @override
  State<RulesOfMemoryGame> createState() => _RulesOfMemoryGameState();
}

class _RulesOfMemoryGameState extends State<RulesOfMemoryGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [closeButton(0)],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "How big is your memory span?",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        "As soon as you start this test, a random string of characters will be displayed at intervals of about one second, consisting of digits in the first run and letters in the second. After viewing, you will be prompted to play the characters. Enter the characters using your keyboard and confirm your entry by pressing the Enter key. If entered correctly, the process is repeated, adding another character. You can make one mistake per run, the second wrong entry will end the respective run. At the end of this test you will see your results.",
                        style: TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                customButton("START TEST", () {
                  Get.offNamed(characterNumber);
                })
              ],
            ),
          )),
    );
  }
}

class BrainTestNumber extends StatefulWidget {
  const BrainTestNumber({super.key});

  @override
  State<BrainTestNumber> createState() => _BrainTestNumberState();
}

class _BrainTestNumberState extends State<BrainTestNumber> {
  String generatedValue = '';
  String currentlyShowing = '';
  bool finish = false;
  final controller = TextEditingController();

  //for generate number
  int number = 0;
  int correctCount = 0;
  int incorrectCount = 0;

  generateSingleNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(9);
    number = randomNumber + 1;
    generatedValue = generatedValue + number.toString();
  }

  generateNumber() {
    for (var i = 0; i < correctCount + incorrectCount + 2; i++) {
      generateSingleNumber();
    }
    print("total-$generatedValue");
  }

  //showing text with animation
  myFunc() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == generatedValue.length + 1) {
        timer.cancel();
        finish = true;
        setState(() {});
        print('canel done');
      } else {
        print('${timer.tick} , ${generatedValue.length}');
        setState(() {
          currentlyShowing = generatedValue[timer.tick - 1];
        });
      }
    });
  }

  @override
  void initState() {
    generateNumber();
    myFunc();
    super.initState();
  }

  var box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          closeButton(0),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: finish == true
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.amber)),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                controller: controller,
                                onSubmitted: (value) {
                                  if (generatedValue ==
                                      controller.text.toString()) {
                                    correctCount = correctCount + 1;
                                    Get.snackbar(
                                      "Good",
                                      "Right Answer",
                                      backgroundColor: Colors.green,
                                    );
                                    generatedValue = '';
                                    currentlyShowing = '';
                                    generateNumber();
                                    myFunc();
                                  } else {
                                    incorrectCount = incorrectCount + 1;

                                    if (incorrectCount > 1) {
                                      Get.snackbar(
                                        "Wrong Answer",
                                        "Now continue with letters",
                                        backgroundColor: Colors.amber,
                                      );
                                      //next quiz chapter
                                      box.write('characterNumbererresult',
                                          correctCount);
                                      Get.offNamed(characterLetter);
                                    } else {
                                      Get.snackbar(
                                        "Wrong",
                                        "Keep trying",
                                        backgroundColor: Colors.red,
                                      );
                                      generatedValue = '';
                                      currentlyShowing = '';

                                      generateNumber();
                                      myFunc();
                                    }
                                  }
                                  controller.clear();

                                  finish = false;
                                  setState(() {});
                                },
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 15, 20, 15),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text(
                                'Enter characters and confirm the entry by pressing the Enter key'),
                          ],
                        ),
                      ),
                    ),
                  )
                : Text(currentlyShowing,
                    style: TextStyle(
                        fontSize: 100,
                        color: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0))),
          ),
        ],
      ),
    );
  }
}

class BrainTestLetter extends StatefulWidget {
  const BrainTestLetter({super.key});

  @override
  State<BrainTestLetter> createState() => _BrainTestLetterState();
}

class _BrainTestLetterState extends State<BrainTestLetter> {
  String generatedValue = '';
  String currentlyShowing = '';
  bool finish = false;
  final controller = TextEditingController();

  //for generate number
  var letter = '';
  int correctCount = 0;
  int incorrectCount = 0;

  generateSingleLetter() {
    letter = '';
    final _rnd = Random();
    const _chars = 'ABCDMNOPQRSTUVWXYZEFGHIJKL';

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    letter = getRandomString(1);
    generatedValue = generatedValue + letter;
  }

  generateNumber() {
    for (var i = 0; i < correctCount + incorrectCount + 2; i++) {
      generateSingleLetter();
    }
    // print("total-$generatedValue");
  }

  //showing text with animation
  myFunc() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == generatedValue.length + 1) {
        timer.cancel();
        finish = true;
        setState(() {});
        // print('canel done');
      } else {
        print('${timer.tick} , ${generatedValue.length}');
        setState(() {
          currentlyShowing = generatedValue[timer.tick - 1];
        });
      }
    });
  }

  @override
  void initState() {
    generateNumber();
    myFunc();
    super.initState();
  }

  var box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            closeButton(0),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: finish == true
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.amber)),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  controller: controller,
                                  onSubmitted: (value) {
                                    if (generatedValue ==
                                        controller.text.toString()) {
                                      correctCount = correctCount + 1;
                                      Get.snackbar(
                                        "Good",
                                        "Right Answer",
                                        backgroundColor: Colors.green,
                                      );
                                      generatedValue = '';
                                      currentlyShowing = '';
                                      generateNumber();
                                      myFunc();
                                    } else {
                                      incorrectCount = incorrectCount + 1;

                                      if (incorrectCount > 1) {
                                        //next quiz chapter
                                        box.write('characterLetterresult',
                                            correctCount);
                                        Get.offNamed(summary);
                                      } else {
                                        Get.snackbar(
                                          "Wrong",
                                          "Keep trying",
                                          backgroundColor: Colors.red,
                                        );
                                        generatedValue = '';
                                        currentlyShowing = '';

                                        generateNumber();
                                        myFunc();
                                      }
                                    }
                                    controller.clear();

                                    finish = false;
                                    setState(() {});
                                  },
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(15, 15, 20, 15),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                  'Enter characters and confirm the entry by pressing the Enter key'),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(currentlyShowing,
                      style: TextStyle(
                          fontSize: 100,
                          color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                  .toInt())
                              .withOpacity(1.0))),
            ),
          ],
        ));
  }
}

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  var characterNumberResult;
  var characterLetterResult;
  var box = GetStorage();
  @override
  void initState() {
    var a = box.read('characterNumbererresult') ?? 0;
    var b = box.read('characterLetterresult') ?? 0;
    characterNumberResult = a;
    characterLetterResult = b;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          closeButton(0),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "How big is your memory span?",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            (characterNumberResult == 0)
                                ? const Text.rich(TextSpan(children: [
                                    TextSpan(text: 'You have not memorized '),
                                    TextSpan(
                                        text: 'any',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' number.'),
                                  ]))
                                : Text.rich(TextSpan(children: [
                                    const TextSpan(text: 'You have memorized '),
                                    TextSpan(
                                        text: '$characterNumberResult',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    const TextSpan(text: ' digits.'),
                                  ])),
                            (characterNumberResult == 0)
                                ? const Text(
                                    "You can do better, try again in a moment")
                                : (characterNumberResult < 5)
                                    ? const Text(
                                        "That can certainly be increased, practice makes perfect!")
                                    : const Text("Good job"),
                            const SizedBox(
                              height: 10,
                            ),
                            (characterLetterResult == 0)
                                ? const Text.rich(TextSpan(children: [
                                    TextSpan(text: 'You have not memorized '),
                                    TextSpan(
                                        text: 'any',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' number.'),
                                  ]))
                                : Text.rich(TextSpan(children: [
                                    const TextSpan(text: 'You have memorized '),
                                    TextSpan(
                                        text: '$characterLetterResult',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    const TextSpan(text: ' letter.'),
                                  ])),
                            (characterLetterResult == 0)
                                ? const Text(
                                    "You can do better, try again in a moment")
                                : (characterLetterResult < 5)
                                    ? const Text(
                                        "That can certainly be increased, practice makes perfect!")
                                    : const Text("Good job"),
                          ],
                        ))),
                const SizedBox(
                  height: 20,
                ),
                customButton("SHOW Total Result", () {
                  Get.offNamed(showTotalresult);
                })
              ],
            ),
          )),
    );
  }
}

class ShowTotalResult extends StatefulWidget {
  @override
  State<ShowTotalResult> createState() => _ShowTotalResultState();
}

class _ShowTotalResultState extends State<ShowTotalResult> {
  // const Favourite({super.key});
  List colors = [
    Color(0xFFFE2A25),
    Color.fromARGB(255, 205, 147, 13),
    Color(0xFFFFBA00),
    Color.fromARGB(255, 37, 254, 48),
    Color(0xFF00AB47),
  ];
  List score = ['very low', 'low', 'average', 'high', 'very high'];
  var box = GetStorage();
  var limicuNumber;
  var limicuLetter;
  var ivgValue;
  var msValue;
  @override
  void initState() {
    var a = box.read('characterNumbererresult') ?? 0;
    var b = box.read('characterLetterresult') ?? 0;
    var c = box.read('number') ?? 0;
    var d = box.read('letter') ?? 0;
    limicuNumber = a * 2;
    limicuLetter = b * 2;
    ivgValue = int.parse(c) * 2;
    msValue = int.parse(d) * 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: closeButton(0),
            ),
            Text(
              'Your evaluation (IVG and MS)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 150,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      showLabels: false,
                      showAxisLine: false,
                      showTicks: false,
                      minimum: 0,
                      maximum: 100,
                      radiusFactor: 1,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 10,
                            endValue: 26,
                            color: Color(0xFFFE2A25),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.35,
                            endWidth: 0.35),
                        GaugeRange(
                            startValue: 26,
                            endValue: 42,
                            color: Color.fromARGB(255, 205, 147, 13),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.35,
                            endWidth: 0.35),
                        GaugeRange(
                          startValue: 42,
                          endValue: 58,
                          color: Color(0xFFFFBA00),
                          startWidth: 0.35,
                          endWidth: 0.35,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                        GaugeRange(
                            startValue: 58,
                            endValue: 74,
                            color: Color.fromARGB(255, 37, 254, 48),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.35,
                            endWidth: 0.35),
                        GaugeRange(
                          startValue: 74,
                          endValue: 90,
                          color: Color(0xFF00AB47),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.35,
                          endWidth: 0.35,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(value: 10.0 + ivgValue.toDouble())
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget:
                                customText('IVG-Wert: ${ivgValue / 2} von 60'),
                            angle: 90,
                            positionFactor: 0.5)
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      showLabels: false,
                      showAxisLine: false,
                      showTicks: false,
                      minimum: 0,
                      maximum: 100,
                      radiusFactor: 1,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 10,
                            endValue: 26,
                            color: Color(0xFFFE2A25),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.35,
                            endWidth: 0.35),
                        GaugeRange(
                            startValue: 26,
                            endValue: 42,
                            color: Color.fromARGB(255, 205, 147, 13),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.35,
                            endWidth: 0.35),
                        GaugeRange(
                          startValue: 42,
                          endValue: 58,
                          color: Color(0xFFFFBA00),
                          startWidth: 0.35,
                          endWidth: 0.35,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                        GaugeRange(
                            startValue: 58,
                            endValue: 74,
                            color: Color.fromARGB(255, 37, 254, 48),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.35,
                            endWidth: 0.35),
                        GaugeRange(
                          startValue: 74,
                          endValue: 90,
                          color: Color(0xFF00AB47),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.35,
                          endWidth: 0.35,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(value: 10.0 + msValue.toDouble())
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget:
                                customText('MS-Wert: ${msValue / 2} von 60'),
                            angle: 90,
                            positionFactor: 0.5)
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      showLabels: false,
                      showAxisLine: false,
                      showTicks: false,
                      minimum: 0,
                      maximum: 100,
                      radiusFactor: 1,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 10,
                            endValue: 26,
                            color: Color(0xFFFE2A25),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.35,
                            endWidth: 0.35),
                        GaugeRange(
                            startValue: 26,
                            endValue: 42,
                            color: Color.fromARGB(255, 205, 147, 13),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.35,
                            endWidth: 0.35),
                        GaugeRange(
                          startValue: 42,
                          endValue: 58,
                          color: Color(0xFFFFBA00),
                          startWidth: 0.35,
                          endWidth: 0.35,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                        GaugeRange(
                            startValue: 58,
                            endValue: 74,
                            color: Color.fromARGB(255, 37, 254, 48),
                            sizeUnit: GaugeSizeUnit.factor,
                            startWidth: 0.35,
                            endWidth: 0.35),
                        GaugeRange(
                          startValue: 74,
                          endValue: 90,
                          color: Color(0xFF00AB47),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.35,
                          endWidth: 0.35,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                            value: 10.0 +
                                limicuNumber.toDouble() +
                                limicuLetter.toDouble())
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: customText(
                                'limicu-Kognitionswert: ${(limicuNumber + limicuLetter) / 2} von 100'),
                            angle: 90,
                            positionFactor: 0.5)
                      ]),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 40,
                      width: 70,
                      color: colors[index],
                      child: Center(
                          child: Text(
                        score[index],
                        style: TextStyle(color: Colors.white),
                      )),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
