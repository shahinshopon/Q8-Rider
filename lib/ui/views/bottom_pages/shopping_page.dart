import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/views/bottom_pages/market_page.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/ui/widgets/custome_text_field.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class BottomShoopingPage extends StatefulWidget {
  @override
  State<BottomShoopingPage> createState() => _BottomShoopingPageState();
}

class _BottomShoopingPageState extends State<BottomShoopingPage> {
  TextEditingController horseAgeController = TextEditingController();

  TextEditingController horsePriceController = TextEditingController();

  TextEditingController horseBreedController = TextEditingController();

  TextEditingController horseHeightController = TextEditingController();
  TextEditingController multilineController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;
  Rx<TextEditingController> timeController = TextEditingController().obs;

  String dropdownvalue = 'male';

  var items = [
    'male',
    'female',
  ];

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  void selectImage() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  Rx<DateTime> selectedDate = DateTime.now().obs;
  String? dob;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate) {
      dob = "${selected.day} - ${selected.month} - ${selected.year}";
      _dobController.value.text = dob!;
    }
  }

  DateTime dateTimeSelected = DateTime.now();
  void _openTimePickerSheet(BuildContext context) async {
    final result = await TimePicker.show<DateTime?>(
      context: context,
      sheet: TimePickerSheet(
        sheetTitle: 'Select meeting schedule',
        minuteTitle: 'Minute',
        hourTitle: 'Hour',
        saveButtonText: 'Save',
      ),
    );

    if (result != null) {
      setState(() {
        dateTimeSelected = result;
        timeController.value.text = dateTimeSelected.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Auction Notice', style: AppStyles().appBarTextStyle),
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.selectDate,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
              5.ph,
              Obx(
                () => TextFormField(
                  controller: _dobController.value,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: AppStrings.birth,
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.calendar_month_rounded),
                      ),
                      border: OutlineInputBorder()),
                ),
              ),
              10.ph,
              Text(AppStrings.SelectTime,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
              5.ph,
              TextFormField(
                controller: timeController.value,
                readOnly: true,
                decoration: InputDecoration(
                    hintText:
                        'Time ${dateTimeSelected.hour}:${dateTimeSelected.minute}',
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => _openTimePickerSheet(context),
                      icon: Icon(Icons.access_time),
                    ),
                    border: OutlineInputBorder()),
              ),
              10.ph,
              Text('Upload Horse Image/video',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
              10.ph,
              InkWell(
                onTap: () {
                  selectImage();
                },
                child: DottedBorder(
                  color: Colors.black,
                  strokeWidth: 1,
                  dashPattern: [10, 6],
                  child: SizedBox(
                    height: 100.h,
                    width: double.maxFinite,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_file,
                          size: 20.w,
                        ),
                        Text(
                          AppStrings.uplode,
                          style: AppStyles().textFieldOutText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 80.h,
                child: GridView.builder(
                  itemCount: imageFileList!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (_, index) {
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.file(
                          File(imageFileList![index].path),
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    imageFileList!.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.highlight_remove,
                                  size: 20.w,
                                )))
                      ],
                    );
                  },
                ),
              ),
              5.ph,
              customTextField(AppStrings.HorseAge, horseAgeController,
                  AppStrings.enterHorseAge),
              customTextField(AppStrings.HorsePrice, horsePriceController,
                  AppStrings.enterHorsePrice),
              customTextField(AppStrings.horseBreed, horseBreedController,
                  AppStrings.enterHorseBreed),
              customTextField(AppStrings.horseHight, horseHeightController,
                  AppStrings.enterHorseHeight),
              Text(AppStrings.HorseType,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
              10.ph,
              Container(
                height: 55.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black45)),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButton(
                        value: dropdownvalue,
                        isExpanded: true,

                        // dropdownColor: Colors.transparent,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              10.ph,
              Text(AppStrings.detailOptiona,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
              10.ph,
              SizedBox(
                height: 100.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  // expands: true,
                  maxLines: 4,
                  controller: multilineController,
                  decoration: InputDecoration(
                      hintText: AppStrings.detailYourHorse,
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder()),
                ),
              ),
              10.ph,
              RichText(
                  text: TextSpan(
                      text: AppStrings.beforeProceeding,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                    TextSpan(
                      text: AppStrings.termsCondition,
                      style: AppStyles().richTextStyle,
                    ),
                  ])),
              20.ph,
              horseAppButton(AppStrings.post, () {
               
               Get.to(BottomMarketPage());
              })
            ],
          ),
        ),
      )),
    );
  }
}
