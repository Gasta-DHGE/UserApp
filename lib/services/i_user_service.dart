import '../models/models.dart';

abstract class IUserService {
  Future<void> createUser(String userId, GastaUser userData);
  Future<void> updateUser(String userId, GastaUser userData);
  Future<GastaUser> getUserByIdAsync(String id);
}
