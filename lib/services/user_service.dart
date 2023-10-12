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
  Future<void> createUser(String userId, GastaUser userData) async {
    await source.createUserData(
        userId, MappingService.map<GastaUser, core.UserEntity>(userData));
  }

  @override
  Future<void> updateUser(String userId, GastaUser userData) async {
    await source.updateUser(
        userId, MappingService.map<GastaUser, core.UserEntity>(userData));
  }

  @override
  Future<GastaUser> getUserByIdAsync(String userId) async {
    return MappingService.map<core.UserModel, GastaUser>(
        await source.getUserById(userId));
  }
}
