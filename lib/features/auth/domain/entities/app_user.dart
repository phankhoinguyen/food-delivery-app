class AppUser {
  final String uid;
  final String email;
  final String name;

  AppUser({required this.uid, required this.email, required this.name});

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'email': email, 'name': name};
  }
}
