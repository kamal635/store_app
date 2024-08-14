part of 'image_user_put_file_bloc.dart';

sealed class ImageUserPutFileState extends Equatable {
  const ImageUserPutFileState();

  @override
  List<Object> get props => [];
}

final class ImageUserPutFileInitial extends ImageUserPutFileState {}

final class ImageUserPutFileLoading extends ImageUserPutFileState {}

final class ImageUserPutFileSuccess extends ImageUserPutFileState {
  final String donlowadUrl;

  const ImageUserPutFileSuccess({required this.donlowadUrl});
  @override
  List<Object> get props => [donlowadUrl];
}

final class ImageUserPutFileFailure extends ImageUserPutFileState {
  final String errorMessage;

  const ImageUserPutFileFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
