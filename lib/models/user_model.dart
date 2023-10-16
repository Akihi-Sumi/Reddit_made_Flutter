import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String name,
    required String profilePic,
    required String banner,
    required String uid,
    required bool isAuthenticated,
    required int karma,
    required List<String> awards,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;

    return UserModel.fromJson(<String, dynamic>{
      ...data,
      'userId': ds.id,
    });
  }
}
