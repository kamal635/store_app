import 'package:flutter/material.dart';
import '../widgets/change_pass_note/body_change_pass_success.dart';

class NoteChangePasswordView extends StatelessWidget {
  const NoteChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoteChangePasswordViewBody(),
    );
  }
}
