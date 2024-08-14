import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/classes/icons.dart';
import '../../../../core/color/app_color.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';

class SectionFormFieldAndDeleteAllFavoriteAndCart extends StatelessWidget {
  const SectionFormFieldAndDeleteAllFavoriteAndCart(
      {super.key, this.onChanged, this.onPressedIconDelete});
  final Function(String)? onChanged;
  final Function()? onPressedIconDelete;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            hintColor: AppColor.darkGrey,
            colorIcon: AppColor.darkGrey,
            hint: S.of(context).Search,
            prefixIcon: AppIcon.search,
            fillColor: AppColor.white,
            onChanged: onChanged,
          ),
        ),
        IconButton(
            onPressed: onPressedIconDelete,
            icon: Icon(
              AppIcon.trash,
              size: 22.h,
              color: AppColor.jGDark,
            ))
      ],
    );
  }
}
