import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_elvated_button.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_listen_bloc/auth_listen_bloc.dart';
import 'package:store_app/feautres/auth/presentation/bloc/user_bloc/update_user_bloc/update_user_bloc.dart';
import 'package:store_app/generated/l10n.dart';

class SectionButtonMyInfo extends StatelessWidget {
  const SectionButtonMyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthListenBloc, AuthListenState>(
      builder: (context, authListenState) {
        final userEntity = authListenState.userModel!;
        return BlocBuilder<UpdateUserBloc, UpdateUserState>(
          builder: (context, state) {
            return CustomElvatedButton(
              isTitle: state is UpdateUserLoading ? false : true,
              onPressed: () {
                BlocProvider.of<UpdateUserBloc>(context)
                    .add(UpdateTappedUserEvent(userModel: userEntity));
              },
              title: S.of(context).update,
              isRadius: false,
            );
          },
        );
      },
    );
  }
}
