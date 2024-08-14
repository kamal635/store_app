import 'package:flutter/material.dart';
import '../../../../core/color/app_color.dart';
import '../widgets/login_or_register/section_button.dart';
import '../widgets/login_or_register/section_text.dart';
import 'package:video_player/video_player.dart';

class LoginOrSkip extends StatefulWidget {
  const LoginOrSkip({Key? key}) : super(key: key);

  @override
  State<LoginOrSkip> createState() => _LoginOrSkipState();
}

class _LoginOrSkipState extends State<LoginOrSkip> {
  late VideoPlayerController _playerController;

  @override
  void initState() {
    super.initState();

    _playerController = VideoPlayerController.asset(
      "assets/videos/2.mp4",
    )..initialize().then((_) {
        _playerController.play();
        _playerController.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _playerController.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: _playerController.value.size.width,
                      height: _playerController.value.size.height,
                      child: VideoPlayer(_playerController),
                    ),
                  ),
                )
              : Container(),
          Container(
            color: AppColor.blacK.withAlpha(60),
          ),
          const SectionTextLoginOrRegister(),
          const SectionButtonLoginOrRegister(),
        ],
      ),
    );
  }
}
