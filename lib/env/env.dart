import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: "locks.env")
abstract class Env{

  @EnviedField(varName: "androidApiKey",obfuscate: true)
  static final String androidApiKey = _Env.androidApiKey;


  @EnviedField(varName: "iosApiKey",obfuscate: true)
  static final String iosApiKey = _Env.iosApiKey;


  @EnviedField(varName: "androidAppId",obfuscate: true)
  static final String androidAppId = _Env.androidAppId;

  @EnviedField(varName: "iosAppId",obfuscate: true)
  static final String iosAppId = _Env.iosAppId;

  @EnviedField(varName: "messagingSenderId",obfuscate: true)
  static final String messagingSenderId = _Env.messagingSenderId;

  @EnviedField(varName: "projectId",obfuscate: true)
  static final String projectId = _Env.projectId;

  @EnviedField(varName: "storageBucket",obfuscate: true)
  static final String storageBucket = _Env.storageBucket;

  @EnviedField(varName: "iosBundleId",obfuscate: true)
  static final String iosBundleId = _Env.iosBundleId;
}