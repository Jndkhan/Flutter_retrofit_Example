import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse{

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;


  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'email')
  final String? email;

  UserResponse({this.id, this.name, this.avatar, this.email});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> tojson () => _$UserResponseToJson(this);




}