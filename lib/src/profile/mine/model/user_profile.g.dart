// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      json['assetManageId'] as int,
      json['assetManageName'] as String,
      json['collectCount'] as int,
      json['message'] as int,
      json['nickName'] as String,
      json['phone'] as String,
      json['photo'] as String,
      json['soundFlag'] as int,
      json['userId'] as int,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'assetManageId': instance.assetManageId,
      'assetManageName': instance.assetManageName,
      'collectCount': instance.collectCount,
      'message': instance.message,
      'nickName': instance.nickName,
      'phone': instance.phone,
      'photo': instance.photo,
      'soundFlag': instance.soundFlag,
      'userId': instance.userId,
    };
