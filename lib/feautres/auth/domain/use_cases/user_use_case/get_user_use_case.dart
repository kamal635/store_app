import 'package:store_app/feautres/auth/data/models/user.dart';
import '../../repository/user_repository/get_user_repo.dart';

class GetUserUseCase {
  final GetUserRepo getUserRepo;

  GetUserUseCase({required this.getUserRepo});
  Stream<UserModel> call(String userId) {
    return getUserRepo.getUser(userId);
  }
}
