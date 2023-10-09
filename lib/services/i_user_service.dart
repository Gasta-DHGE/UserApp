import '../models/models.dart';

abstract class IUserService {
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<GastaUser?> getUserByIdAsync(String id);
}
