import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:zhuque_kit/src/model/resp.dart';
import 'package:zhuque_kit/src/zhuque_kit_platform_interface.dart';

/// An implementation of [ZhuqueKitPlatform] that uses method channels.
class MethodChannelZhuqueKit extends ZhuqueKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  late final MethodChannel methodChannel =
      const MethodChannel('com.ying.jzds/sdk')
        ..setMethodCallHandler(_handleMethod);

  final StreamController<ZhuqueResp> _respStreamController =
      StreamController<ZhuqueResp>.broadcast();

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'onLoginResp':
        _respStreamController.add(ZhuqueLoginResp.fromJson(
            (call.arguments as Map<dynamic, dynamic>).cast<String, dynamic>()));
      case 'onShareResp':
        _respStreamController.add(ZhuqueShareMsgResp.fromJson(
            (call.arguments as Map<dynamic, dynamic>).cast<String, dynamic>()));
    }
  }

  @override
  Future<void> registerApp({
    required String appId,
    String? universalLink,
  }) {
    return methodChannel.invokeMethod<void>(
      'registerApp',
      <String, dynamic>{
        'appId': appId,
        if (universalLink?.isNotEmpty ?? false) 'universalLink': universalLink,
      },
    );
  }

  @override
  Stream<ZhuqueResp> respStream() {
    return _respStreamController.stream;
  }

  @override
  Future<int> getChannelID() async {
    return await methodChannel.invokeMethod<int>('getChannelID') ?? 0;
  }

  @override
  Future<String> getUid() async {
    return await methodChannel.invokeMethod<String>('getUid') ?? '';
  }

  @override
  Future<void> login() {
    return methodChannel.invokeMethod<void>('login');
  }

  @override
  Future<void> loginWithoutRealnameAuth() {
    return methodChannel.invokeMethod('loginWithoutRealnameAuth');
  }

  @override
  Future<void> logout() {
    return methodChannel.invokeMethod<void>('logout');
  }

  @override
  Future<void> showAgreementWithLicence() {
    return methodChannel.invokeMethod<void>('showAgreementWithLicence');
  }

  @override
  Future<void> showAgreementWithPrivacy() {
    return methodChannel.invokeMethod<void>('showAgreementWithPrivacy');
  }
}
