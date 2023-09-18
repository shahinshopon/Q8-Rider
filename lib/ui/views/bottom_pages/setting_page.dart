// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/views/auth_pages/sign_in.dart';
import 'package:practice/ui/views/bottom_nav.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';
import 'package:image_picker/image_picker.dart';

class BottomSettingPage extends StatefulWidget {
  @override
  State<BottomSettingPage> createState() => _BottomSettingPageState();
}

class _BottomSettingPageState extends State<BottomSettingPage> {
  XFile? image;

  pickGalleryImage() async {
    final ImagePicker picker = ImagePicker();
    image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {});
  }

  RxBool value = false.obs;
  RxBool darkMode = false.obs;
  final box = GetStorage();
  changeTheme(context) {
    if (darkMode.value == false) {
      print('action triggerd');
      Get.changeThemeMode(ThemeMode.light);
    } else {
      print('action triggerd 2');
      Get.changeThemeMode(ThemeMode.dark);
    }
    box.write('theme', darkMode.value == false ? 'light' : 'dark');
  }

  @override
  void initState() {
    var theme = box.read('theme');
    if (theme == null) {
      darkMode.value = false;

      print(theme);
    } else if (theme == 'dark') {
      darkMode.value = true;
      print(theme);
    } else {
      darkMode.value = false;
      print(theme);
    }
    var store = box.read('owner')??value.value;
    value.value = store;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(AppStrings.setting, style: AppStyles().appBarTextStyle),
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: [
                    Card(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: image == null
                            ? Icon(
                                Icons.person_outlined,
                                size: 40,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                child: Image.file(
                                  File(image!.path),
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      elevation: 5,
                    ),
                    Positioned(
                      bottom: -10,
                      child: InkWell(
                        onTap: () => pickGalleryImage(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 20,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              10.ph,
              Text(
                AppStrings.ibneRiead,
                style: AppStyles().appBarTextStyle,
              ),
              Text(
                AppStrings.gmail,
                style: AppStyles().textFieldOutText,
              ),
              20.ph,
              customListTile(
                  AppStrings.language,
                  Icon(
                    Icons.language_outlined,
                    size: 20.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20.w,
                  )),
              customListTile(
                AppStrings.theme,
                Icon(
                  Icons.thermostat_outlined,
                  size: 20.w,
                ),
                Obx(
                  () => SizedBox(
                    width: 60,
                    child: DayNightSwitcher(
                      isDarkModeEnabled: darkMode.value,
                      onStateChanged: (isDarkModeEnabled) {
                        darkMode.value = isDarkModeEnabled;
                        changeTheme(context);
                      },
                    ),
                  ),
                ),
              ),
              customListTile(
                  AppStrings.terms,
                  Icon(
                    Icons.text_snippet_outlined,
                    size: 20.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20.w,
                  )),
              customListTile(
                  AppStrings.Policy,
                  Icon(
                    Icons.privacy_tip_outlined,
                    size: 20.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20.w,
                  )),
              customListTile(
                AppStrings.switchOwner,
                Icon(
                  Icons.phone_in_talk_outlined,
                  size: 20.w,
                ),
                Obx(
                  () => Switch(
                      value: value.value,
                      onChanged: (val) {
                        value.value = val;
                        box.write('owner', value.value);
                        Get.to(SignIn());
                      }),
                ),
              ),
              customListTile(
                  AppStrings.contactUs,
                  Icon(
                    Icons.phone_in_talk_outlined,
                    size: 20.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20.w,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

customListTile(String Title, leadingIcon, trallingIcon) {
  return ListTile(
    title: Text(
      Title,
      style: AppStyles().textFieldOutText,
    ),
    leading: leadingIcon,
    trailing: trallingIcon,
  );
}
