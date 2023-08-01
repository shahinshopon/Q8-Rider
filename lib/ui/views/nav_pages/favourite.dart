import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/style/app_styles.dart';
import 'package:practice/ui/widgets/custom_button.dart';
import 'package:practice/ui/widgets/custom_dialog.dart';

class Favourite extends StatefulWidget {
  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sleep Coach",
                    style: TextStyle(fontSize: 20, color: Color(0xffDDA372)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: CupertinoColors.activeOrange, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: SizedBox(
                      width: 51,
                      height: 31,
                      child: CupertinoSwitch(
                        value: switchValue,
                        trackColor: Colors.transparent,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                        activeColor: Colors.transparent,
                        thumbColor: CupertinoColors.activeOrange,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    Text(
                        "Sleep is the most important source of regeneration. Stress is reduced, energy stores are replenished, and important learning and healing processes take place. Therefore, it is important that we pay attention to a good night's sleep. The sleep coach will help you!"),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          customDialog(
                              context,
                              'Your sleep time in 90 minute intervals',
                              "Thursday, 02/02/2023, sleep coach.",
                              'assets/icons/logo.png',
                              "The R90 program means 'Recovery in Ninety Minutes'.No random number between one and one hundred was chosen. Rather, ninety minutes is the length of time that a human under clinical conditions needs for the phase that comprises a sleep cycle. Your sleep cycles consist of four (sometimes five) different phases, which you can imagine like walking up a flight of stairs. When you turn off the light in the evening and go to bed, you are practically at the top of the stairs. At the bottom of the stairs is the deep sleep you wish to attain.");
                        },
                        child: Text(
                          "More Info",
                          style: TextStyle(color: Colors.blue),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Watch tutorial video",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: double.infinity, child: customButton('IDEAS', () {})),
              SizedBox(
                  width: double.infinity,
                  child: customButton('EVALUATIONS', () {
                    Get.to(() => SleepCoachSettings());
                  })),
              SizedBox(
                  width: double.infinity,
                  child: customButton('SLEEP RATING', () {
                    Get.to(() => SleepRating());
                  })),
            ],
          ),
        ),
      ),
    );
  }
}

class SleepCoachSettings extends StatefulWidget {
  const SleepCoachSettings({super.key});

  @override
  State<SleepCoachSettings> createState() => _SleepCoachSettingsState();
}

class _SleepCoachSettingsState extends State<SleepCoachSettings> {
  TimeOfDay? initialTime;
  TimeOfDay wakeUpTime = TimeOfDay(hour: 07, minute: 30);
  // double _value = 15;
  //slider
  double value = 15;
  double actualValue = 15.0;
  double minValue = 0.0;
  double maxValue = 60.0;
  List<double> steps = [0, 15, 30, 45, 60];
  var box = GetStorage();

  // checkbox
  final others = checkBoxModel(text: 'Miscellaneous');
  final checkBoxList = [
    checkBoxModel(text: 'Do not use any devices with a display'),
    checkBoxModel(text: 'Write your thoughts for the next day on a pad'),
    checkBoxModel(text: 'Prepare outfit for the next day'),
    checkBoxModel(text: 'Setting the breakfast table for the next morning'),
    checkBoxModel(text: 'Brew bedtime tea'),
    checkBoxModel(text: "Have a last night's snack"),
    checkBoxModel(text: 'Take a quick shower'),
    checkBoxModel(text: 'From now on drink only a little'),
  ];
  var empty = [];
  final inputController = TextEditingController();
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Preperation": 6.3 / 100,
      "Bed Time": (actualValue.toInt() / 15) / 100,
      "Sleep Time": 37.5 / 100,
      // "Wake Up": 70/100,
      "Work": 55.2 / 100
    };
    // var bedtime = TimeOfDay(
    //     hour: initialTime!.hour + 1, minute: initialTime!.minute + 30);
    box.write(
        'sleepTime',
        initialTime == null
            ? '22:30'
            : (initialTime!.hour + 1 + 2 >= 24 &&
                    initialTime!.minute + 30 + actualValue.toInt() >= 120)
                ? "${initialTime!.hour + 1 + 2 - 24}:${initialTime!.minute + 30 + actualValue.toInt() - 120}"
                : (initialTime!.hour + 1 + 2 < 24 &&
                        initialTime!.minute + 30 + actualValue.toInt() >= 120)
                    ? "${initialTime!.hour + 1 + 2}:${initialTime!.minute + 30 + actualValue.toInt() - 120}"
                    : (initialTime!.hour + 1 + 2 >= 24 &&
                            initialTime!.minute + 30 + actualValue.toInt() ==
                                120)
                        ? "${initialTime!.hour + 1 + 2 - 24}:00"
                        : (initialTime!.hour + 1 + 2 < 24 &&
                                initialTime!.minute +
                                        30 +
                                        actualValue.toInt() ==
                                    120)
                            ? "${initialTime!.hour + 1 + 2}:00"
                            : (initialTime!.hour + 1 + 1 >= 24 &&
                                    initialTime!.minute +
                                            30 +
                                            actualValue.toInt() >=
                                        60)
                                ? "${initialTime!.hour + 1 + 1 - 24}:${initialTime!.minute + 30 + actualValue.toInt() - 60}"
                                : (initialTime!.hour + 1 + 1 < 24 &&
                                        initialTime!.minute +
                                                30 +
                                                actualValue.toInt() >
                                            60)
                                    ? "${initialTime!.hour + 1 + 1}:${initialTime!.minute + 30 + actualValue.toInt() - 60}"
                                    : (initialTime!.hour + 1 >= 24 &&
                                            initialTime!.minute +
                                                    30 +
                                                    actualValue.toInt() <
                                                60)
                                        ? "${initialTime!.hour + 1 - 24}:${initialTime!.minute + 30 + actualValue.toInt()}"
                                        : (initialTime!.hour + 1 < 24 &&
                                                initialTime!.minute +
                                                        30 +
                                                        actualValue.toInt() <
                                                    60)
                                            ? "${initialTime!.hour + 1}:${initialTime!.minute + 30 + actualValue.toInt()}"
                                            : (initialTime!.hour + 1 + 1 >=
                                                        24 &&
                                                    initialTime!.minute +
                                                            30 +
                                                            actualValue
                                                                .toInt() ==
                                                        60)
                                                ? "${initialTime!.hour + 1 + 1 - 24}:00"
                                                : (initialTime!.hour + 1 + 1 <
                                                            24 &&
                                                        initialTime!.minute +
                                                                30 +
                                                                actualValue
                                                                    .toInt() ==
                                                            60)
                                                    ? "${initialTime!.hour + 1 + 1}:00"
                                                    : "22:30");
    var sleeptime = box.read('sleepTime');
    String firstHalf = sleeptime.substring(0, sleeptime.indexOf(':'));
    String secHalf = sleeptime.substring(sleeptime.indexOf(':') + 1);

    int hour = int.parse(firstHalf);
    int min = int.parse(secHalf);
    var a = (12 < hour && hour < 24)
        ? (24 - hour) + wakeUpTime.hour
        : wakeUpTime.hour - hour;
    var b = (wakeUpTime.minute - min).abs();
//print((wakeUpTime.hour<24)?wakeUpTime.hour+hour-24:wakeUpTime.hour-hour);
    print(wakeUpTime.minute - min);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep coach Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Wrap(
                spacing: 5,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          InkWell(
                            onTap: () async {
                              initialTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(hour: 20, minute: 45),
                                builder: (BuildContext context, Widget? child) {
                                  return MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(alwaysUse24HourFormat: true),
                                    child: child!,
                                  );
                                },
                              );
                              setState(() {});
                            },
                            child: Container(
                              height: 110,
                              color: Color(0xff6B64CB),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/icons/logo.png',
                                        width: 20.w),
                                    initialTime == null
                                        ? Text('20:45',
                                            style: AppStyles().timeTextStyle)
                                        : initialTime!.minute < 10
                                            ? Text(
                                                '${initialTime!.hour}:0${initialTime!.minute}',
                                                style:
                                                    AppStyles().timeTextStyle,
                                              )
                                            : Text(
                                                '${initialTime!.hour}:${initialTime!.minute}',
                                                style:
                                                    AppStyles().timeTextStyle)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: -20,
                              right: -15,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xff6B64CB),
                                child: Text("90'",
                                    style: TextStyle(color: Colors.white)),
                              ))
                        ],
                      ),
                      Text('Preparation')
                    ],
                  ),
                  //SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 110,
                            color: Color(0xff6B64CB),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/logo.png',
                                      width: 20.w),
                                  initialTime == null
                                      ? Text('22:15',
                                          style: AppStyles().timeTextStyle)
                                      : (initialTime!.hour + 1 + 1 >= 24 &&
                                              initialTime!.minute + 30 >= 60)
                                          ? Text('${initialTime!.hour + 2 - 24}:${initialTime!.minute + 30 - 60}',
                                              style: AppStyles().timeTextStyle)
                                          : (initialTime!.hour + 1 + 1 < 24 &&
                                                  initialTime!.minute + 30 >=
                                                      60)
                                              ? Text('${initialTime!.hour + 2}:${initialTime!.minute + 30 - 60}',
                                                  style:
                                                      AppStyles().timeTextStyle)
                                              : (initialTime!.hour + 1 >= 24 &&
                                                      initialTime!.minute + 30 <
                                                          60)
                                                  ? Text(
                                                      '${initialTime!.hour + 1 - 24}:${initialTime!.minute + 30}',
                                                      style: AppStyles()
                                                          .timeTextStyle)
                                                  : (initialTime!.hour + 1 < 24 &&
                                                          initialTime!.minute + 30 <
                                                              60)
                                                      ? Text(
                                                          '${initialTime!.hour + 1}:${initialTime!.minute + 30}',
                                                          style: AppStyles()
                                                              .timeTextStyle)
                                                      : (initialTime!.hour + 1 + 1 ==
                                                                  24 &&
                                                              initialTime!.minute + 30 >
                                                                  60)
                                                          ? Text(
                                                              '00:${initialTime!.minute + 30 - 60}',
                                                              style: AppStyles()
                                                                  .timeTextStyle)
                                                          : (initialTime!.hour +
                                                                          1 +
                                                                          1 >=
                                                                      24 &&
                                                                  initialTime!.minute + 30 == 60)
                                                              ? Text('${initialTime!.hour + 2 - 24}:00', style: AppStyles().timeTextStyle)
                                                              : (initialTime!.hour + 1 < 24 && initialTime!.minute + 30 == 60)
                                                                  ? Text('${initialTime!.hour + 1 + 1}:00', style: AppStyles().timeTextStyle)
                                                                  : (initialTime!.hour + 1 + 1 == 24 && initialTime!.minute + 30 == 60)
                                                                      ? Text('00:00', style: AppStyles().timeTextStyle)
                                                                      : Text(
                                                                          "No match",
                                                                          style:
                                                                              AppStyles().timeTextStyle,
                                                                        )
                                  // : initialTime!.hour > 22
                                  //     ? initialTime!.minute > 30
                                  //         ? Text(
                                  //             "0${initialTime!.hour + 2 - 24}:${initialTime!.minute + 30 - 60}",
                                  //             style: TextStyle(
                                  //                 fontSize: 20,
                                  //                 color: Colors.white))
                                  //         : Text(
                                  //             "0${initialTime!.hour + 1 - 24}:${initialTime!.minute + 30}",
                                  //             style: TextStyle(
                                  //                 fontSize: 20,
                                  //                 color: Colors.white))

                                  //     : initialTime!.hour > 21
                                  //         ? initialTime!.minute > 30
                                  //             ? Text(
                                  //                 "0${initialTime!.hour + 2 - 24}:${initialTime!.minute + 30 - 60}",
                                  //                 style: TextStyle(
                                  //                     fontSize: 20,
                                  //                     color: Colors.white))
                                  //             : Text(
                                  //                 "${initialTime!.hour + 1}:${initialTime!.minute + 30}",
                                  //                 style: TextStyle(
                                  //                     fontSize: 20,
                                  //                     color: Colors.white))
                                  //         : initialTime!.minute > 30
                                  //             ? Text(
                                  //                 "${initialTime!.hour + 2}:${initialTime!.minute + 30 - 60}",
                                  //                 style: TextStyle(
                                  //                     fontSize: 20,
                                  //                     color: Colors.white))
                                  //             : Text(
                                  //                 "${initialTime!.hour + 1}:${initialTime!.minute + 30}",
                                  //                 style: TextStyle(
                                  //                     fontSize: 20,
                                  //                     color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: -20,
                              right: -10,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xff6B64CB),
                                child: Text(
                                  "${actualValue.toInt()}'",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                      Text('Bed Time')
                    ],
                  ),
                  //SizedBox(width: 8,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 110,
                            color: Color(0xff6B64CB),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/logo.png',
                                      width: 20.w),
                                  initialTime == null
                                      ? Text('22:30',
                                          style: AppStyles().timeTextStyle)
                                      : (initialTime!.hour + 1 + 2 >= 24 &&
                                              initialTime!.minute +
                                                      30 +
                                                      actualValue.toInt() >=
                                                  120)
                                          ? Text("${initialTime!.hour + 1 + 2 - 24}:${initialTime!.minute + 30 + actualValue.toInt() - 120}",
                                              style: AppStyles().timeTextStyle)
                                          : (initialTime!.hour + 1 + 2 < 24 &&
                                                  initialTime!.minute +
                                                          30 +
                                                          actualValue.toInt() >=
                                                      120)
                                              ? Text("${initialTime!.hour + 1 + 2}:${initialTime!.minute + 30 + actualValue.toInt() - 120}",
                                                  style:
                                                      AppStyles().timeTextStyle)
                                              : (initialTime!.hour + 1 + 2 >= 24 &&
                                                      initialTime!.minute + 30 + actualValue.toInt() ==
                                                          120)
                                                  ? Text("${initialTime!.hour + 1 + 2 - 24}:00",
                                                      style: AppStyles()
                                                          .timeTextStyle)
                                                  : (initialTime!.hour + 1 + 2 < 24 &&
                                                          initialTime!.minute +
                                                                  30 +
                                                                  actualValue
                                                                      .toInt() ==
                                                              120)
                                                      ? Text(
                                                          "${initialTime!.hour + 1 + 2}:00",
                                                          style: AppStyles().timeTextStyle)
                                                      : (initialTime!.hour + 1 + 1 >= 24 && initialTime!.minute + 30 + actualValue.toInt() >= 60)
                                                          ? Text("${initialTime!.hour + 1 + 1 - 24}:${initialTime!.minute + 30 + actualValue.toInt() - 60}", style: AppStyles().timeTextStyle)
                                                          : (initialTime!.hour + 1 + 1 < 24 && initialTime!.minute + 30 + actualValue.toInt() >= 60)
                                                              ? Text("${initialTime!.hour + 1 + 1}:${initialTime!.minute + 30 + actualValue.toInt() - 60}", style: AppStyles().timeTextStyle)
                                                              : (initialTime!.hour + 1 >= 24 && initialTime!.minute + 30 + actualValue.toInt() < 60)
                                                                  ? Text("${initialTime!.hour + 1 - 24}:${initialTime!.minute + 30 + actualValue.toInt()}", style: AppStyles().timeTextStyle)
                                                                  : (initialTime!.hour + 1 < 24 && initialTime!.minute + 30 + actualValue.toInt() < 60)
                                                                      ? Text("${initialTime!.hour + 1}:${initialTime!.minute + 30 + actualValue.toInt()}", style: AppStyles().timeTextStyle)
                                                                      : (initialTime!.hour + 1 + 1 >= 24 && initialTime!.minute + 30 + actualValue.toInt() == 60)
                                                                          ? Text("${initialTime!.hour + 1 + 1 - 24}:00", style: AppStyles().timeTextStyle)
                                                                          : (initialTime!.hour + 1 + 1 < 24 && initialTime!.minute + 30 + actualValue.toInt() == 60)
                                                                              ? Text("${initialTime!.hour + 1 + 1}:00", style: AppStyles().timeTextStyle)
                                                                              : (initialTime!.hour + 1 + 2 == 24 && initialTime!.minute + 30 + actualValue.toInt() >= 120)
                                                                                  ? Text("00:${initialTime!.minute + 30 + actualValue.toInt() - 120}", style: AppStyles().timeTextStyle)
                                                                                  : (initialTime!.hour + 1 + 1 == 24 && initialTime!.minute + 30 + actualValue.toInt() >= 60)
                                                                                      ? Text("00:${initialTime!.minute + 30 + actualValue.toInt() - 60}", style: AppStyles().timeTextStyle)
                                                                                      : (initialTime!.hour + 1 + 1 == 24 && initialTime!.minute + 30 + actualValue.toInt() < 60)
                                                                                          ? Text("00:${initialTime!.minute + 30 + actualValue.toInt()}", style: AppStyles().timeTextStyle)
                                                                                          : Text("No match", style: AppStyles().timeTextStyle)
                                  //  initialTime!.minute > 15
                                  //     ? initialTime!.hour > 22
                                  //         ? Text(
                                  //             "0${initialTime!.hour + 1 - 24}:${initialTime!.minute + 45}",
                                  //             style: TextStyle(
                                  //                 fontSize: 20,
                                  //                 color: Colors.white))
                                  //         : Text(
                                  //             "${initialTime!.hour + 1}:${initialTime!.minute + 45}",
                                  //             style: TextStyle(
                                  //                 fontSize: 20,
                                  //                 color: Colors.white))
                                  //     : initialTime!.hour > 21
                                  //         ? Text(
                                  //             "0${initialTime!.hour + 2 - 24}:${initialTime!.minute - 15}",
                                  //             style: TextStyle(
                                  //                 fontSize: 20,
                                  //                 color: Colors.white))
                                  //         : Text(
                                  //             "${initialTime!.hour + 2}:${initialTime!.minute - 15}",
                                  //             style: TextStyle(
                                  //                 fontSize: 20,
                                  //                 color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              top: -20,
                              right: -10,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xff6B64CB),
                                child: Text("$a",
                                    style: TextStyle(color: Colors.white)),
                              ))
                        ],
                      ),
                      Text('Sleep Time')
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          wakeUpTime = (await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 07, minute: 30),
                            builder: (BuildContext context, Widget? child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: true),
                                child: child!,
                              );
                            },
                          ))!;
                          setState(() {});
                        },
                        child: Container(
                          height: 110,
                          color: Color(0xff6B64CB),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/logo.png',
                                    width: 20.w),
                                initialTime == null
                                    ? Text('20:45',
                                        style: AppStyles().timeTextStyle)
                                    : wakeUpTime.minute < 10
                                        ? Text(
                                            '${wakeUpTime.hour}:0${wakeUpTime.minute}',
                                            style: AppStyles().timeTextStyle,
                                          )
                                        : Text(
                                            '${wakeUpTime.hour}:${wakeUpTime.minute}',
                                            style: AppStyles().timeTextStyle)
                                // initialTime == null
                                //     ? Text('07:30',
                                //         style: AppStyles().timeTextStyle)
                                //     : (initialTime!.hour + 1 + 2 >= 24 &&
                                //             initialTime!.minute + 30 + actualValue.toInt() >=
                                //                 120)
                                //         ? Text("${initialTime!.hour + 1 + 2 - 24}:${initialTime!.minute + 30 + actualValue.toInt() - 120}",
                                //             style: AppStyles().timeTextStyle)
                                //         : (initialTime!.hour + 1 + 2 < 24 &&
                                //                 initialTime!.minute +
                                //                         30 +
                                //                         actualValue.toInt() >=
                                //                     120)
                                //             ? Text("${initialTime!.hour + 1 + 2}:${initialTime!.minute + 30 + actualValue.toInt() - 120}",
                                //                 style: AppStyles().timeTextStyle)
                                //             : (initialTime!.hour + 1 + 2 >= 24 &&
                                //                     initialTime!.minute +
                                //                             30 +
                                //                             actualValue.toInt() ==
                                //                         120)
                                //                 ? Text("${initialTime!.hour + 1 + 2 - 24}:00",
                                //                     style:
                                //                         AppStyles().timeTextStyle)
                                //                 : (initialTime!.hour + 1 + 2 < 24 &&
                                //                         initialTime!.minute + 30 + actualValue.toInt() ==
                                //                             120)
                                //                     ? Text("${initialTime!.hour + 1 + 2}:00",
                                //                         style: AppStyles()
                                //                             .timeTextStyle)
                                //                     : (initialTime!.hour + 1 + 1 >= 24 &&
                                //                             initialTime!.minute + 30 + actualValue.toInt() >= 60)
                                //                         ? Text("${initialTime!.hour + 1 + 1 - 24}:${initialTime!.minute + 30 + actualValue.toInt() - 60}", style: AppStyles().timeTextStyle)
                                //                         : (initialTime!.hour + 1 + 1 < 24 && initialTime!.minute + 30 + actualValue.toInt() >= 60)
                                //                             ? Text("${initialTime!.hour + 1 + 1}:${initialTime!.minute + 30 + actualValue.toInt() - 60}", style: AppStyles().timeTextStyle)
                                //                             : (initialTime!.hour + 1 >= 24 && initialTime!.minute + 30 + actualValue.toInt() < 60)
                                //                                 ? Text("${initialTime!.hour + 1 - 24}:${initialTime!.minute + 30 + actualValue.toInt()}", style: AppStyles().timeTextStyle)
                                //                                 : (initialTime!.hour + 1 < 24 && initialTime!.minute + 30 + actualValue.toInt() < 60)
                                //                                     ? Text("${initialTime!.hour + 1}:${initialTime!.minute + 30 + actualValue.toInt()}", style: AppStyles().timeTextStyle)
                                //                                     : (initialTime!.hour + 1 + 1 >= 24 && initialTime!.minute + 30 + actualValue.toInt() == 60)
                                //                                         ? Text("${initialTime!.hour + 1 + 1 - 24}:00", style: AppStyles().timeTextStyle)
                                //                                         : (initialTime!.hour + 1 + 1 < 24 && initialTime!.minute + 30 + actualValue.toInt() == 60)
                                //                                             ? Text("${initialTime!.hour + 1 + 1}:00", style: AppStyles().timeTextStyle)
                                //                                             : Text("No match", style: AppStyles().timeTextStyle)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text('Wake Up Time')
                    ],
                  ),

                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Stack(
                  //       clipBehavior: Clip.none,
                  //       children: [
                  //         Container(
                  //           height: 110,
                  //           color: Color(0xff6B64CB),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(15.0),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Image.asset('assets/icons/logo.png',
                  //                     width: 20.w),
                  //                 initialTime == null
                  //                     ? Text('22:30',
                  //                         style: TextStyle(
                  //                             fontSize: 20, color: Colors.white))
                  //                     : initialTime!.minute > 15
                  //                         ? initialTime!.hour > 22
                  //                             ? Text(
                  //                                 "0${initialTime!.hour + 1 - 24}:${initialTime!.minute + 45}",
                  //                                 style: TextStyle(
                  //                                     fontSize: 20,
                  //                                     color: Colors.white))
                  //                             : Text(
                  //                                 "${initialTime!.hour + 1}:${initialTime!.minute + 45}",
                  //                                 style: TextStyle(
                  //                                     fontSize: 20,
                  //                                     color: Colors.white))
                  //                         : initialTime!.hour > 21
                  //                             ? Text(
                  //                                 "0${initialTime!.hour + 2 - 24}:${initialTime!.minute - 15}",
                  //                                 style: TextStyle(
                  //                                     fontSize: 20,
                  //                                     color: Colors.white))
                  //                             : Text(
                  //                                 "${initialTime!.hour + 2}:${initialTime!.minute - 15}",
                  //                                 style: TextStyle(
                  //                                     fontSize: 20,
                  //                                     color: Colors.white))
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Positioned(
                  //             top: -20,
                  //             right: -10,
                  //             child: CircleAvatar(
                  //               radius: 20,
                  //               backgroundColor: Color(0xff6B64CB),
                  //               child: Text("9.0",
                  //                   style: TextStyle(color: Colors.white)),
                  //             ))
                  //       ],
                  //     ),
                  //     Text('Sleep Time')
                  //   ],
                  // ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       height: 110,
                  //       color: Color(0xff6B64CB),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(15.0),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Image.asset('assets/icons/logo.png', width: 20.w),
                  //             initialTime == null
                  //                 ? Text('07:30',
                  //                     style: TextStyle(
                  //                         fontSize: 20, color: Colors.white))
                  //                 : initialTime!.minute > 15
                  //                     ? initialTime!.hour > 14
                  //                         ? Text(
                  //                             "0${initialTime!.hour + 11 - 24}:${initialTime!.minute - 15}",
                  //                             style: TextStyle(
                  //                                 fontSize: 20,
                  //                                 color: Colors.white))
                  //                         : Text(
                  //                             "${initialTime!.hour + 11}:${initialTime!.minute - 15}",
                  //                             style: TextStyle(
                  //                                 fontSize: 20,
                  //                                 color: Colors.white))
                  //                     : initialTime!.hour > 14
                  //                         ? Text(
                  //                             "0${initialTime!.hour + 11 - 24}:${15 - initialTime!.minute}",
                  //                             style: TextStyle(
                  //                                 fontSize: 20,
                  //                                 color: Colors.white))
                  //                         : Text(
                  //                             "${initialTime!.hour + 10}:${initialTime!.minute + 45}",
                  //                             style: TextStyle(
                  //                                 fontSize: 20,
                  //                                 color: Colors.white))
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Text('Wake Up Time')
                  //   ],
                  // ),
                ],
              ),
              SizedBox(
                height: 40,
              ),

              //     SliderTheme(
              //       data: SliderTheme.of(context).copyWith(
              //         trackHeight: 25,
              //       //  overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
              //       //thumbColor: Colors.transparent,
              // thumbShape: SliderComponentShape.noThumb,
              //       activeTrackColor: Colors.green,
              //       inactiveTrackColor: Colors.white,
              //       trackShape: RectangularSliderTrackShape()
              //       ),
              //       child: Slider(
              //       min: 0.0,
              //       max: 60.0,
              //       //divisions: 4,
              //       // activeColor: Colors.green,
              //       // inactiveColor: Colors.white,
              //        //thumbColor: Colors.greenAccent,
              //       value: _value,
              //      // label: '${_value.round()}',
              //       onChanged: (value) {
              //         setState(() {
              //           _value = value;
              //         });
              //       },
              //     ),
              //     ),

              CustomSlider(
                minValue: minValue,
                maxValue: maxValue,
                value: value,
                majorTick: 3,
                minorTick: 1,
                labelValuePrecision: 0,
                tickValuePrecision: 0,
                onChanged: (val) {
                  initialTime = TimeOfDay(hour: 20, minute: 45);
                  setState(() {
                    value = val;
                    actualValue = steps[
                        (val / maxValue * (steps.length - 1)).ceil().toInt()];

                    // print('Slider value (linear): $value');
                    // print('Actual value (non-linear): $actualValue');
                  });
                },
                activeColor: Colors.orange,
                inactiveColor: Colors.orange.shade50,
                linearStep: false,
                steps: steps,
              ),
              Text("$actualValue"),

              PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                //chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: [
                  Colors.green,
                  Colors.yellow,
                  Colors.black,
                  Colors.white
                ],
                initialAngleInDegree: 0,
                chartType: ChartType.disc,

                // ringStrokeWidth: 32,
                // centerText: "HYBRID",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  //legendShape: _BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: false,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  //decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(TextSpan(children: [
                const TextSpan(
                  text: 'Use the top slider to set your',
                ),
                TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: ' sleep time ',
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600)),
                const TextSpan(
                  text: 'and the bottom slider to specify',
                ),
                TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: ' how long you want to sleep ',
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600)),
                const TextSpan(
                  text: 'and what time you usually',
                ),
                TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: ' wake up ',
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w600)),
                const TextSpan(
                  text: 'during the week.',
                ),
              ])),
              TextButton(
                  onPressed: () {
                    customDialog(
                        context,
                        'Your sleep time in 90 minute intervals',
                        "Thursday, 02/02/2023, sleep coach.",
                        'assets/icons/logo.png',
                        "The R90 program means 'Recovery in Ninety Minutes'.No random number between one and one hundred was chosen. Rather, ninety minutes is the length of time that a human under clinical conditions needs for the phase that comprises a sleep cycle. Your sleep cycles consist of four (sometimes five) different phases, which you can imagine like walking up a flight of stairs. When you turn off the light in the evening and go to bed, you are practically at the top of the stairs. At the bottom of the stairs is the deep sleep you wish to attain.");
                  },
                  child: Text('More information about this')),
              Text('Memories'),
              Text('What do you want the sleep coach to remind you of?'),
              SizedBox(
                height: 20,
              ),
              /////////////
              ...checkBoxList
                  .map(
                    (item) => ListTile(
                      leading: Checkbox(
                          value: item.value,
                          onChanged: (value) {
                            onAllClicked(item);
                            if (item.value == true) {
                              empty.add(item.text);
                            }
                          }),
                      title: Text(item.text, style: TextStyle(fontSize: 16)),
                      onTap: () {
                        onAllClicked(item);
                        if (item.value == true) {
                          empty.add(item.text);
                        }
                      },
                    ),
                  )
                  .toList(),
              ListTile(
                leading: Checkbox(
                    value: others.value,
                    onChanged: (value) => onAllClicked(others)),
                title: Container(
                  height: 40,
                  child: TextField(
                    controller: inputController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        hintText: others.text,
                        hintStyle: TextStyle(fontSize: 16)),
                  ),
                ),
                onTap: () => onAllClicked(others),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: CupertinoColors.activeOrange, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: SizedBox(
                      width: 40,
                      height: 25,
                      child: CupertinoSwitch(
                        value: switchValue,
                        trackColor: Colors.transparent,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                        activeColor: Colors.transparent,
                        thumbColor: CupertinoColors.activeOrange,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "sound for memories",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: customButton('OK', () {
                  if (others.value == true) {
                    empty.add(inputController.text);
                  }
                  Get.back();
                  //update state for showing input text
                }),
              ),
              ///////////////
            ],
          ),
        ),
      ),
    );
  }

  onAllClicked(checkBoxModel checkItem) {
    setState(() {
      checkItem.value = !checkItem.value;
    });
  }
}

class checkBoxModel {
  String text;
  bool value;
  checkBoxModel({required this.text, this.value = false});
}

class CustomSlider extends StatelessWidget {
  final double value;
  final double minValue;
  final double maxValue;
  final int majorTick;
  final int minorTick;
  final Function(double)? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final int labelValuePrecision;
  final int tickValuePrecision;
  final bool linearStep;
  final List<double>? steps;

  CustomSlider({
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.majorTick,
    required this.minorTick,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.labelValuePrecision = 2,
    this.tickValuePrecision = 1,
    this.linearStep = true,
    this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final allocatedHeight = MediaQuery.of(context).size.height;
    final allocatedWidth = MediaQuery.of(context).size.width;
    final divisions = (majorTick - 1) * minorTick + majorTick;
    final double valueHeight =
        allocatedHeight * 0.05 < 41 ? 41 : allocatedHeight * 0.05;
    final double tickHeight =
        allocatedHeight * 0.025 < 20 ? 20 : allocatedHeight * 0.025;
    final labelOffset = allocatedWidth / divisions / 2;

    return Column(
      children: [
        Row(
          children: List.generate(
            divisions,
            (index) => Expanded(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: valueHeight,
                    child: index % (minorTick + 1) == 0
                        ? Text(
                            linearStep
                                ? '${(index / (divisions - 1) * maxValue).toStringAsFixed(tickValuePrecision)}'
                                : '${(steps?[index])?.toStringAsFixed(tickValuePrecision)}',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : null,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: tickHeight,
                    child: VerticalDivider(
                      indent: index % (minorTick + 1) == 0 ? 2 : 3,
                      thickness: 1.2,
                      color: (index / (divisions - 1)) * maxValue == value
                          ? activeColor ?? Colors.orange
                          : Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: labelOffset),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight:
                  allocatedHeight * 0.011 < 9 ? 9 : allocatedHeight * 0.011,
              activeTickMarkColor: activeColor ?? Colors.orange,
              inactiveTickMarkColor: inactiveColor ?? Colors.orange.shade50,
              activeTrackColor: activeColor ?? Colors.orange,
              inactiveTrackColor: inactiveColor ?? Colors.orange.shade50,
              thumbColor: activeColor ?? Colors.orange,
              overlayColor: activeColor == null
                  ? Colors.orange.withOpacity(0.1)
                  : activeColor!.withOpacity(0.1),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              trackShape: CustomTrackShape(),
              showValueIndicator: ShowValueIndicator.never,
              valueIndicatorTextStyle: TextStyle(
                fontSize: 12,
              ),
            ),
            child: Slider(
              value: value,
              min: minValue,
              max: maxValue,
              divisions: divisions - 1,
              onChanged: onChanged,
              label: value.toStringAsFixed(labelValuePrecision),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

//sleep rating

class SleepRating extends StatefulWidget {
  @override
  State<SleepRating> createState() => _SleepRatingState();
}

class _SleepRatingState extends State<SleepRating> {
  double value = 62.5;
  double minValue = 0.0;
  double maxValue = 100.0;
  List<double> steps = [0, 12.5, 25, 37.5, 50, 62.5, 75, 87.5, 100];
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 4) {
      return 'Good Night';
    }
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(alignment: Alignment.topRight,
                child: closeButton(1)),
              Text(
                greeting(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Afran Sarkar !',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Time to get up.'),
              Text('Please rate your sleep'),
              SizedBox(
                height: 30,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sleep Quality',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 10,
              ),
              CustomSlider(
                minValue: minValue,
                maxValue: maxValue,
                value: value,
                majorTick: 5,
                minorTick: 1,
                labelValuePrecision: 0,
                tickValuePrecision: 0,
                onChanged: (val) {
                  setState(() {
                    value = val;
                  });
                },
                activeColor: Colors.orange,
                inactiveColor: Colors.orange.shade50,
                linearStep: false,
                steps: steps,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: customButton('Ok', () {
                  if (value < 60) {
                    print('back');
                  } else {
                    Get.to(SleepQualityFirstStep());
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SleepQualityFirstStep extends StatelessWidget {
  const SleepQualityFirstStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Align(alignment: Alignment.topRight,
                child: closeButton(1)),
            Text('Slept badly?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                "Would you like to name us the Grinde,why didn't you sleep well?"),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: customButton('FOR SLEEP EVALUATION', () {
                Get.to(SleepQualitySecondStep());
              }),
            )
          ],
        ),
      )),
    );
  }
}

class SleepQualitySecondStep extends StatefulWidget {
  SleepQualitySecondStep({super.key});

  @override
  State<SleepQualitySecondStep> createState() => _SleepQualitySecondStepState();
}

class _SleepQualitySecondStepState extends State<SleepQualitySecondStep> {
  // String? gender;

  final others = checkBoxModel(text: 'Miscellaneous');
  final checkBoxList = [
    checkBoxModel(text: 'One'),
    checkBoxModel(text: 'two'),
    checkBoxModel(text: 'three'),
  ];
  var empty = [];
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Align(alignment: Alignment.topRight,
                child: closeButton(1)),
            Text('Sleep Rating',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 30,
            ),
            Text("Why did you sleep badly?"),
            SizedBox(
              height: 30,
            ),
            // Column(
            //   children: [
            //     RadioListTile(
            //       title: Text("Male"),
            //       value: "male",
            //       groupValue: gender,
            //       onChanged: (value) {
            //         setState(() {
            //           gender = value.toString();
            //         });
            //       },
            //     ),
            //     RadioListTile(
            //       title: Text("Female"),
            //       value: "female",
            //       groupValue: gender,
            //       onChanged: (value) {
            //         setState(() {
            //           gender = value.toString();
            //         });
            //       },
            //     ),
            //     RadioListTile(
            //       title: Text("Other"),
            //       value: "other",
            //       groupValue: gender,
            //       onChanged: (value) {
            //         setState(() {
            //           gender = value.toString();
            //         });
            //       },
            //     )
            //   ],
            // ),

            ...checkBoxList
                .map(
                  (item) => ListTile(
                    leading: Checkbox(
                        value: item.value,
                        onChanged: (value) {
                          onAllClicked(item);
                          if (item.value == true) {
                            empty.add(item.text);
                          }
                        }),
                    title: Text(item.text, style: TextStyle(fontSize: 16)),
                    onTap: () {
                      onAllClicked(item);
                      if (item.value == true) {
                        empty.add(item.text);
                      }
                    },
                  ),
                )
                .toList(),
            ListTile(
              leading: Checkbox(
                  value: others.value,
                  onChanged: (value) => onAllClicked(others)),
              title: Container(
                height: 40,
                child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      hintText: others.text,
                      hintStyle: TextStyle(fontSize: 16)),
                ),
              ),
              onTap: () => onAllClicked(others),
            ),
            Container(
              width: double.infinity,
              child: customButton('OK', () {
                if (others.value == true) {
                  empty.add(inputController.text);
                }
                Get.to(SleepQualityThirdStep());
                //update state for showing input text
              }),
            ),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: empty.length,
            //       itemBuilder: (context, index) {
            //         return Text(empty[index].toString());
            //       }),
            // )
          ],
        ),
      )),
    );
  }

  onAllClicked(checkBoxModel checkItem) {
    setState(() {
      checkItem.value = !checkItem.value;
    });
  }
}

// class checkBoxModel {
//   String text;
//   bool value;
//   checkBoxModel({required this.text, this.value = false});
// }

class SleepQualityThirdStep extends StatelessWidget {
  const SleepQualityThirdStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(alignment: Alignment.topRight,
                child: closeButton(1)),
            Text(
              "I could not fall asleep",
              style: TextStyle(fontSize: 20, color: Color(0xffDDA372)),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(border: Border.all()),
              child: Column(
                children: [
                  Text(
                      "You couldn't sleep because: 'It was too loud in the room' "),
                  Text("My advice:"),
                  Text(
                      'If the window is open, sleep with the window closed and prefer to leave the bedroom door open. 10 minutes of vigorous airing before going to bed is enough'),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        customDialog(
                            context,
                            'Your sleep time in 90 minute intervals',
                            "Thursday, 02/02/2023, sleep coach.",
                            'assets/icons/logo.png',
                            "The R90 program means 'Recovery in Ninety Minutes'.No random number between one and one hundred was chosen. Rather, ninety minutes is the length of time that a human under clinical conditions needs for the phase that comprises a sleep cycle. Your sleep cycles consist of four (sometimes five) different phases, which you can imagine like walking up a flight of stairs. When you turn off the light in the evening and go to bed, you are practically at the top of the stairs. At the bottom of the stairs is the deep sleep you wish to attain.");
                      },
                      child: Text(
                        "More Info",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: double.infinity,
                child: customButton('OK', () {
                  Get.toNamed(bottomNav);
                }))
          ],
        ),
      )),
    );
  }
}
