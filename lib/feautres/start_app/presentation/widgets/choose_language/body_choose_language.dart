import 'package:flutter/material.dart';
import 'section_button.dart';
import 'section_image.dart';
import 'section_text.dart';

class ChooseLanguageViewBody extends StatelessWidget {
  const ChooseLanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SectionImageChooseLanguage(),
        SectionTextChooseLanguage(),
        SectionButtonLanguage(),
      ],
    );
  }
}
