import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/classes/onbording.dart';
import 'section_bottom.dart';
import 'section_image.dart';
import 'section_text.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  final PageController pageController = PageController();
  int index = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightContainer = MediaQuery.of(context).size.height / 2;

    return PageView.builder(
        controller: pageController,
        itemCount: ClassOnBording.onBordingList(context).length,
        itemBuilder: (context, i) {
          index = i;

          final onBording = ClassOnBording.onBordingList(context)[i];
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.h, vertical: kToolbarHeight),
                  child: Column(
                    children: [
                      //images
                      SectionImageOnBording(
                        image: onBording.image,
                        heightContainer: heightContainer,
                      ),
                      SizedBox(height: heightContainer / 8),
                      //titles
                      SectionText(
                        title1: onBording.title1,
                        title2: onBording.title2,
                        subtitle: onBording.subTitle,
                        heightContainer: heightContainer,
                      ),
                      const Spacer(),
                      //icon button
                      SectionBottom(
                        pageController: pageController,
                        index: index,
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
