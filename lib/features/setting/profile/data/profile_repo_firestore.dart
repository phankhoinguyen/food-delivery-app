import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_delivery/features/auth/domain/entities/app_user.dart';
import 'package:food_delivery/features/setting/profile/domain/entities/user_profile.dart';
import 'package:food_delivery/features/setting/profile/domain/repo/profile_repo.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepoFirestore implements ProfileRepo {
  final AppUser? user;
  ProfileRepoFirestore(this.user);
  final _db = FirebaseFirestore.instance;
  final picker = ImagePicker();

  @override
  Future<UserProfile> getProfile() async {
    final ref = await _db.collection('user').doc(user!.uid).get();

    final userProfile = UserProfile.fromJson(ref.data()!);
    return userProfile;
  }

  @override
  Future<void> editAddress(List<String> newString) async {
    await _db.collection('user').doc(user!.uid).update({
      'address': [...newString],
    });
  }

  @override
  Future<void> editName(String newName) async {
    await _db.collection('user').doc(user!.uid).update({'name': newName});
  }

  @override
  Future<void> uploadAvatar(ImageSource source) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('user_images')
        .child('${user!.uid}.jpg');
    final img = await picker.pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (img != null) {
      final imgFile = File(img.path);
      await storageRef.putFile(imgFile);
      final imgUrl = await storageRef.getDownloadURL();
      await _db.collection('user').doc(user!.uid).update({'imgUrl': imgUrl});
    }
  }
}
