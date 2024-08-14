import 'package:flutter/material.dart';
import 'image_assets.dart';
import '../../generated/l10n.dart';

class ClassOnBording {
  final String image;
  final String title1;
  final String title2;
  final String subTitle;

  ClassOnBording({
    required this.image,
    required this.title1,
    required this.title2,
    required this.subTitle,
  });

  static List<ClassOnBording> onBordingList(BuildContext context) {
    return [
      ClassOnBording(
        image: AppAssets.womenClothing,
        title1: S.of(context).onBordingDiscount1,
        title2: S.of(context).onBordingDiscount2,
        subTitle: S.of(context).onBordingSubTitle,
      ),
      ClassOnBording(
        image: AppAssets.laptop,
        title1: S.of(context).onBordingTakeAdvantage1,
        title2: S.of(context).onBordingTakeAdvantage2,
        subTitle: S.of(context).onBordingSubTitle,
      ),
      ClassOnBording(
        image: AppAssets.shoes,
        title1: S.of(context).onBordingAllTypes1,
        title2: S.of(context).onBordingAllTypes2,
        subTitle: S.of(context).onBordingSubTitle,
      ),
    ];
  }
}
