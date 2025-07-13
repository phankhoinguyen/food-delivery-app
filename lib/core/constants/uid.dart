import 'package:uuid/uuid.dart';

const uuid = Uuid();

String get generateUid {
  return uuid.v4();
}
