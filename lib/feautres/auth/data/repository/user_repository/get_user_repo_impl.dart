import 'package:store_app/feautres/auth/data/models/user.dart';
import '../../data_source/remote_data_source/user_remote/get_user_remote.dart';
import '../../../domain/repository/user_repository/get_user_repo.dart';

class GetUserRepoImpl implements GetUserRepo {
  final GetUserRemoteDataSourceImpl getUserRemoteDataSourceImpl;

  GetUserRepoImpl({required this.getUserRemoteDataSourceImpl});

  @override
  Stream<UserModel> getUser(String userId) {
    return getUserRemoteDataSourceImpl.getUser(userId);
  }
}
