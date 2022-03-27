import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';


@JsonSerializable()
class UserProfile extends Object {

  @JsonKey(name: 'assetManageId')
  int assetManageId;

  @JsonKey(name: 'assetManageName')
  String assetManageName;

  @JsonKey(name: 'collectCount')
  int collectCount;

  @JsonKey(name: 'message')
  int message;

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'photo')
  String photo;

  @JsonKey(name: 'soundFlag')
  int soundFlag;

  @JsonKey(name: 'userId')
  int userId;

  UserProfile(this.assetManageId,this.assetManageName,this.collectCount,this.message,this.nickName,this.phone,this.photo,this.soundFlag,this.userId,);

  factory UserProfile.fromJson(Map<String, dynamic> srcJson) => _$UserProfileFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

}

  
