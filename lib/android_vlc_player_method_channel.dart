import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_vlc_player_platform_interface.dart';

/// An implementation of [AndroidVlcPlayerPlatform] that uses method channels.
class MethodChannelAndroidVlcPlayer extends AndroidVlcPlayerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_vlc_player');

  @override
  Future<bool?> startVLCPlayer({
    required String filePath,
    required String extension,
    required String title,
  }) async {
    final success = await methodChannel.invokeMethod<bool>('startVLCPlayer', {
      'filePath': filePath,
      'extension': extension,
      'title': title,
    });
    return success;
  }
}
