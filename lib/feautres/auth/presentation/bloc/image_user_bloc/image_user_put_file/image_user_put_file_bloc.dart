import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_app/feautres/auth/domain/use_cases/image_user_use_case/image_user_put_file.dart';
import 'package:store_app/feautres/auth/presentation/bloc/auth_listen_bloc/auth_listen_bloc.dart';

part 'image_user_put_file_event.dart';
part 'image_user_put_file_state.dart';

class ImageUserPutFileBloc
    extends Bloc<ImageUserPutFileEvent, ImageUserPutFileState> {
  final ImageUserPutFileUseCase imageUserPutFileUseCase;
  final imagePicker = ImagePicker();
  File? file;
  String? nameImage;

  final AuthListenBloc authListenBloc;
  ImageUserPutFileBloc({
    required this.imageUserPutFileUseCase,
    required this.authListenBloc,
  }) : super(ImageUserPutFileInitial()) {
    on<ImageUserPutFileEvent>((event, emit) async {
      if (event is PutFileEvent) {
        emit(ImageUserPutFileLoading());
        await _initImagePicker();

        final imageUser = await imageUserPutFileUseCase.putFile(
            "$nameImage", file, authListenBloc.state.userModel!.email);
        imageUser.fold((l) {
          return emit(ImageUserPutFileFailure(errorMessage: l.message));
        }, (r) {
          return emit(ImageUserPutFileSuccess(donlowadUrl: r));
        });
      }
    });
  }

  Future<void> _initImagePicker() async {
    final imagePicked =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      nameImage = imagePicked.name;
      file = File(imagePicked.path);
    } else {}
  }
}
