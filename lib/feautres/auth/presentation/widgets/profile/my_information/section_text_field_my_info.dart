import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/color/app_color.dart';
import 'package:store_app/core/function/toast_flutter.dart';

import 'package:store_app/feautres/auth/presentation/bloc/auth_listen_bloc/auth_listen_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/user_bloc/update_user_bloc/update_user_bloc.dart';

import 'package:store_app/feautres/auth/presentation/widgets/profile/my_information/custom_text_field_my_info.dart';
import 'package:store_app/generated/l10n.dart';

class SectionTextFieldMyInfo extends StatelessWidget {
  const SectionTextFieldMyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UpdateUserBloc>(context);
    return BlocConsumer<UpdateUserBloc, UpdateUserState>(
      listener: (context, state) {
        if (state is UpdateUserFailure) {
          toast(message: state.errorMessage, color: AppColor.erorr);
        }
        if (state is UpdateUserSuccess) {
          toast(message: "Update Success", color: AppColor.jGDark);
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthListenBloc, AuthListenState>(
          builder: (context, authListenState) {
            final userEntity = authListenState.userModel;
            final isUserAuthenticated =
                authListenState.status == AuthStatus.authenticated;

            return Column(
              children: [
                CustomTextFieldMyInfo(
                  controller: TextEditingController(
                      text: isUserAuthenticated ? userEntity?.fullName : ''),
                  onChanged: (fullName) {
                    bloc.add(FullNameEvent(fullName: fullName!));
                  },
                  titleLable: S.of(context).fullName,
                ),
                CustomTextFieldMyInfo(
                  readOnly: true,
                  controller: TextEditingController(
                      text: isUserAuthenticated ? userEntity?.email : ''),
                  titleLable: S.of(context).emailAddress,
                ),
                CustomTextFieldMyInfo(
                  controller: TextEditingController(
                      text: isUserAuthenticated ? userEntity?.address : ''),
                  onChanged: (address) {
                    bloc.add(AddressEvent(address: address!));
                  },
                  titleLable: S.of(context).address,
                ),
                CustomTextFieldMyInfo(
                  controller: TextEditingController(
                      text: isUserAuthenticated ? userEntity?.country : ''),
                  onChanged: (country) {
                    bloc.add(CountryEvent(country: country!));
                  },
                  titleLable: S.of(context).country,
                ),
                CustomTextFieldMyInfo(
                  controller: TextEditingController(
                      text: isUserAuthenticated ? userEntity?.city : ''),
                  onChanged: (city) {
                    bloc.add(CityEvent(city: city!));
                  },
                  titleLable: S.of(context).city,
                ),
                CustomTextFieldMyInfo(
                  controller: TextEditingController(
                      text: isUserAuthenticated ? userEntity?.zipCode : ''),
                  onChanged: (zipCode) {
                    bloc.add(ZipCodeEvent(zipCode: zipCode!));
                  },
                  titleLable: S.of(context).zipCode,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
