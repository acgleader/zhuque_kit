import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:zhuque_kit/src/constant.dart';
import 'package:zhuque_kit/src/model/resp.dart';
import 'package:zhuque_kit/src/zhuque_kit_method_channel.dart';

abstract class ZhuqueKitPlatform extends PlatformInterface {
  /// Constructs a ZhuqueKitPlatform.
  ZhuqueKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZhuqueKitPlatform _instance = MethodChannelZhuqueKit();

  /// The default instance of [ZhuqueKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelZhuqueKit].
  static ZhuqueKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZhuqueKitPlatform] when
  /// they register themselves.
  static set instance(ZhuqueKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// 向 Open_SDK 注册
  Future<void> registerApp({
    required String appId,
    String? universalLink,
  }) {
    throw UnimplementedError(
        'registerApp({required appId, universalLink}) has not been implemented.');
  }

  ///
  Stream<ZhuqueResp> respStream() {
    throw UnimplementedError('respStream() has not been implemented.');
  }

  /// 获取渠道id
  Future<int> getChannelID() {
    throw UnimplementedError('getChannelID() has not been implemented.');
  }

  /// 获取用户id
  Future<String> getUid() {
    throw UnimplementedError('getUid() has not been implemented.');
  }

  /// 登录
  Future<void> login() {
    throw UnimplementedError('login() has not been implemented.');
  }

  /// 登录 （无实名）
  Future<void> loginWithoutRealnameAuth() {
    throw UnimplementedError(
        'loginWithoutRealnameAuth() has not been implemented.');
  }

  /// 登出
  Future<void> logout() {
    throw UnimplementedError('logout() has not been implemented.');
  }

  /// 显示 - 用户协议
  Future<void> showAgreementWithLicence() {
    throw UnimplementedError(
        'showAgreementWithLicence() has not been implemented.');
  }

  /// 显示 - 隐私协议
  Future<void> showAgreementWithPrivacy() {
    throw UnimplementedError(
        'showAgreementWithPrivacy() has not been implemented.');
  }
}
