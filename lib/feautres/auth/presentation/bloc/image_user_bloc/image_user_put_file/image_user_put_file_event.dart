part of 'image_user_put_file_bloc.dart';

sealed class ImageUserPutFileEvent extends Equatable {
  const ImageUserPutFileEvent();

  @override
  List<Object> get props => [];
}

class PutFileEvent extends ImageUserPutFileEvent {}
