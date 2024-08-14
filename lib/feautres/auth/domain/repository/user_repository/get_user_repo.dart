import 'package:store_app/feautres/auth/data/models/user.dart';

abstract class GetUserRepo {
  Stream<UserModel> getUser(String userId);
}
