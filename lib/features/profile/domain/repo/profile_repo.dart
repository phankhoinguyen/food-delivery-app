import 'package:food_delivery/features/profile/domain/entities/user_profile.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepo {
  Future<UserProfile> getProfile();
  Future<void> editName(String newName);
  Future<void> editAddress(List<String> newString);
  Future<void> uploadAvatar(ImageSource source);
}
