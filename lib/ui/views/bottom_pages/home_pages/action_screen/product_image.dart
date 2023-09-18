

import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/ui/widgets/custome_text_field.dart';

class ProductImageScreen extends StatefulWidget {
  ProductImageScreen({Key? key}) : super(key: key);

  @override
  State<ProductImageScreen> createState() => _ProductImageScreenState();
}

class _ProductImageScreenState extends State<ProductImageScreen> {
  TextEditingController productNameController = TextEditingController();

  TextEditingController productPriceController = TextEditingController();

  TextEditingController multilineController = TextEditingController();

  String dropdownvalue = 'One';

  var items = [
    'One',
    'Two',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Product Image", style: AppStyles().appBarTextStyle),
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
              const SizedBox(height: 8,),
              SizedBox(
                height: 80.h,
                child: GridView.builder(
                  itemCount: imageFileList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  color: Colors.white,
                                )))
                      ],
                    );
                  },
                ),
              ),
              20.ph,
              customTextField("Product Name", productNameController,
                  "Enter Product Name"),
              customTextField("Product price", productPriceController,
                  "Enter Product Price"),
            
              Text("Product Category",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  )),
              10.ph,
              Container(
                height: 55.h,
                width: double.infinity,
                decoration: BoxDecoration( 
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black45
                  )),
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
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
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
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10)
                      )),
                ),
              ),
              Text(AppStrings.characters,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  )),
              20.ph,
              horseAppButton(AppStrings.post, () {
                Get.back();
              })
            ],
          ),
        ),
      )),
    );
  }
}
