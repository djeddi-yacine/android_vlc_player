import 'android_vlc_player_platform_interface.dart';

/// The entry point for using the Android VLC Player plugin.
class AndroidVlcPlayer {
  /// Starts the VLC player with the specified parameters.
  ///
  /// Returns a [Future] that completes with a [bool] indicating whether
  /// the VLC player was launched successfully.
  ///
  /// - [filePath]: The file path of the video.
  /// - [extension]: The file extension of the video.
  /// - [title]: The title to display in the VLC player.
  ///
  /// Throws an [Exception] if an error occurs while starting the VLC player.
  Future<bool?> startVLCPlayer({
    required String file,
    required String mimeType,
    required String title,
  }) {
    return AndroidVlcPlayerPlatform.instance
        .startVLCPlayer(file: file, mimeType: mimeType, title: title);
  }
}
