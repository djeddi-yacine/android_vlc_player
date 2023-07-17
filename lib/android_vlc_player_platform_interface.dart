import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_vlc_player_method_channel.dart';

abstract class AndroidVlcPlayerPlatform extends PlatformInterface {
  /// Constructs a AndroidVlcPlayerPlatform.
  AndroidVlcPlayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidVlcPlayerPlatform _instance = MethodChannelAndroidVlcPlayer();

  /// The default instance of [AndroidVlcPlayerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidVlcPlayer].
  static AndroidVlcPlayerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidVlcPlayerPlatform] when
  /// they register themselves.
  static set instance(AndroidVlcPlayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> startVLCPlayer({
    required String filePath,
    required String extension,
    required String title,
  }) {
    throw UnimplementedError('startVLCPlayer() has not been implemented.');
  }
}
