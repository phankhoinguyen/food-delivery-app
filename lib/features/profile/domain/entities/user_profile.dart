class UserProfile {
  final String uid;
  final String email;
  final String name;
  final String imgUrl;

  const UserProfile({
    required this.uid,
    required this.email,
    required this.name,
    required this.imgUrl,
  });

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email, 'name': name, 'imgUrl': imgUrl};
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
    );
  }
}
