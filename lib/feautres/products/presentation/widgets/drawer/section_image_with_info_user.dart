import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_listen_bloc/auth_listen_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/image_user_bloc/image_user_put_file/image_user_put_file_bloc.dart';
import '../../../../../core/classes/image_assets.dart';
import '../../../../../core/color/app_color.dart';
import '../../../../../core/fonts/app_font.dart';

class SectionImageWithInfoUser extends StatelessWidget {
  const SectionImageWithInfoUser({super.key, required this.widthNameWithEmail});
  final double widthNameWithEmail;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthListenBloc, AuthListenState>(
      builder: (context, state) {
        final userModel = state.userModel;
        return Row(
          children: [
            BlocBuilder<ImageUserPutFileBloc, ImageUserPutFileState>(
              builder: (context, stateImage) {
                return CircleAvatar(
                  radius: 45.h,
                  backgroundColor: AppColor.white,
                  backgroundImage: stateImage is ImageUserPutFileSuccess
                      ? NetworkImage(stateImage.donlowadUrl)
                      : const AssetImage(AppAssets.avatarProfile)
                          as ImageProvider,
                );
              },
            ),
            SizedBox(
              width: widthNameWithEmail,
              child: ListTile(
                title: Text(
                  userModel?.fullName == "" ? "None" : userModel!.fullName,
                  style: AppFonts.bold_16.copyWith(color: AppColor.white),
                ),
                subtitle: Text(
                  userModel!.email,
                  style: AppFonts.semiBold_12.copyWith(color: AppColor.jGDark),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
