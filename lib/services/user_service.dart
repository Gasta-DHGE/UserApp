import 'package:gasta_core/gasta_core.dart' as core;
import 'package:gasta_user_app/models/models.dart';
import 'package:gasta_user_app/services/services.dart';
import 'package:http/http.dart' as http;

class UserService implements IUserService {
  late http.Client client;
  late core.UserRemoteDataSourceImpl source;

  UserService() {
    client = http.Client();
    source = core.UserRemoteDataSourceImpl(client: client);
  }

  @override
  Future<void> createUser(User user) async {
    if (user.gastaUser == null) return;
    await source.createUserData(user.firebaseUser.uid,
        MappingService.map<GastaUser, core.UserEntity>(user.gastaUser!));
  }

  @override
  Future<void> updateUser(User user) async {
    if (user.gastaUser == null) return;
    await source.updateUser(user.firebaseUser.uid,
        MappingService.map<GastaUser, core.UserEntity>(user.gastaUser!));
  }

  @override
  Future<GastaUser?> getUserByIdAsync(String id) async {
    try {
      return MappingService.map<core.UserModel, GastaUser>(
          await source.getUserById(id));
    } catch (e) {
      return null;
    }
  }
}
