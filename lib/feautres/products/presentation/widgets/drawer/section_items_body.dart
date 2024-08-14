import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/classes/icon_drawer.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/utils/go_router.dart';
import '../../../../../generated/l10n.dart';

class SectionItemsBody extends StatelessWidget {
  const SectionItemsBody({super.key, required this.widthDrawer});
  final double widthDrawer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          ItemsDrawer.itemsDrawer(context).length,
          // ItemsDrawer.itemsDrawer.length,
          (i) => InkWell(
            onTap: () {
              if (ItemsDrawer.itemsDrawer(context)[i].title ==
                  S.of(context).home) {
                context.pop();
              }
              if (ItemsDrawer.itemsDrawer(context)[i].title ==
                  S.of(context).profile) {
                context.push(AppRouter.profileView);
              }
              if (ItemsDrawer.itemsDrawer(context)[i].title ==
                  S.of(context).settings) {
                context.push(AppRouter.settings);
              }
              if (ItemsDrawer.itemsDrawer(context)[i].title ==
                  S.of(context).about) {
                context.pop();
              }
            },
            child: Container(
              padding: EdgeInsets.only(
                bottom: 20.h,
              ),
              width: widthDrawer,
              child: Row(
                children: [
                  Icon(
                    ItemsDrawer.itemsDrawer(context)[i].nameIcon,
                    size: ItemsDrawer.itemsDrawer(context)[i].sizedIcon,
                    color: ItemsDrawer.itemsDrawer(context)[i].colorIcon,
                  ),
                  SizedBox(
                    width: 40.h,
                  ),
                  Text(
                    ItemsDrawer.itemsDrawer(context)[i].title,
                    style: ItemsDrawer.itemsDrawer(context)[i]
                        .sizedFont!
                        .copyWith(color: AppColor.background),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
