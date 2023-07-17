import 'android_vlc_player_platform_interface.dart';

class AndroidVlcPlayer {
  Future<bool?> startVLCPlayer({
    required String filePath,
    required String extension,
    required String title,
  }) {
    return AndroidVlcPlayerPlatform.instance
        .startVLCPlayer(filePath: filePath, extension: extension, title: title);
  }
}
