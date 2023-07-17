import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_vlc_player_method_channel.dart';

/// The interface that implementations of android_vlc_player must implement.
///
/// Platform implementations should extend this class rather than implement it as `AndroidVlcPlayerPlatform`.
///
/// To use this interface, plugins should have a platform-specific implementation package
/// and an abstract class that extends `AndroidVlcPlayerPlatform`. The implementation package's
/// `AndroidVlcPlayerPlatform` implementation should extend the abstract class `AndroidVlcPlayerPlatform`
/// from the `android_vlc_player_platform_interface` package.
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

  /// Starts the VLC player with the provided parameters.
  ///
  /// Returns `true` if the VLC player was successfully launched, `false` otherwise.
  ///
  /// Throws an [UnimplementedError] if the platform-specific implementation
  /// doesn't override this method.
  Future<bool?> startVLCPlayer({
    required String filePath,
    required String extension,
    required String title,
  }) {
    throw UnimplementedError('startVLCPlayer() has not been implemented.');
  }
}
