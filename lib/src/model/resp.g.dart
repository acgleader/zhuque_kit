// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZhuqueLoginResp _$ZhuqueLoginRespFromJson(Map<String, dynamic> json) =>
    ZhuqueLoginResp(
      ret: (json['ret'] as num?)?.toInt() ?? 0,
      msg: json['msg'] as String?,
      openid: json['openid'] as String?,
      accessToken: json['access_token'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      createAt: (json['create_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ZhuqueLoginRespToJson(ZhuqueLoginResp instance) =>
    <String, dynamic>{
      'ret': instance.ret,
      'msg': instance.msg,
      'openid': instance.openid,
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'create_at': instance.createAt,
    };

ZhuqueShareMsgResp _$ZhuqueShareMsgRespFromJson(Map<String, dynamic> json) =>
    ZhuqueShareMsgResp(
      ret: (json['ret'] as num?)?.toInt() ?? 0,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$ZhuqueShareMsgRespToJson(ZhuqueShareMsgResp instance) =>
    <String, dynamic>{
      'ret': instance.ret,
      'msg': instance.msg,
    };
