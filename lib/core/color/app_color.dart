import 'package:flutter/material.dart';

class AppColor {
  static const Color blacK = Color(0XFF222222);
  static const Color darkGrey = Color(0XFF666666);
  static const Color grey = Color(0XFFAAAAAA);
  static const Color lightGrey = Color.fromARGB(255, 207, 203, 203);
  static const Color formField = Color(0XFFF3F4F5);
  static const Color background = Color.fromARGB(255, 243, 239, 239);
  static const Color white = Color(0XFFFFFFFF);
  static const Color erorr = Color(0XFFF01F0E);
  static const Color darkTheme = Color(0XFF2E2E2E);
  static const Color star = Color(0XFFFFAB07);

//============== Jungle Green =======================
  static const Color jGDark = Color(0XFF0B7A64);
  static const Color jGMediumDark = Color(0XFF0E9376);
  static const Color jGMedium = Color(0XFF11AF8E);
  static const Color jGMediumLight = Color(0XFF24C7A6);
  static const Color jGLight = Color(0XFF37E5BD);

  //======================= linear gradient ======================
  static LinearGradient linearGradient() {
    return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColor.jGLight,
          AppColor.jGMedium,
          AppColor.jGDark,
        ]);
  }
}
