import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/setting/profile/domain/repo/profile_repo.dart';
import 'package:food_delivery/features/setting/profile/presentation/cubits/profile_state.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCubits extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubits(this.profileRepo) : super(ProfileInitial());

  Future<void> getUserProfile() async {
    emit(ProfileLoading());
    try {
      final user = await profileRepo.getProfile();
      emit(ProfileLoaded(user));
    } on Exception catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> uploadAvatar(ImageSource source) async {
    try {
      await profileRepo.uploadAvatar(source);
      await getUserProfile();
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> editInfo(String editField, String newValue) async {
    if (editField == 'name') {
      try {
        await profileRepo.editName(newValue);
        await getUserProfile();
      } catch (e) {
        emit(ProfileError(e.toString()));
      }
    }
  }
}
