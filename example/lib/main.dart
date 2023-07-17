import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_vlc_player/android_vlc_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _androidVlcPlayerPlugin = AndroidVlcPlayer();
  bool _vlc = false;

  Future<void> vlc({
    required String file,
    required String mimeType,
    required String title,
  }) async {
    bool vlc;
    try {
      vlc = await _androidVlcPlayerPlugin.startVLCPlayer(
              file: mimeType, mimeType: mimeType, title: title) ??
          false;
    } on PlatformException {
      vlc = false;
    }

    setState(() {
      _vlc = vlc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('vlc: ${_vlc.toString()}\n'),
              ElevatedButton(
                onPressed: () => vlc(
                    file:
                        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    mimeType: 'video/*',
                    title: 'test'),
                child: const Text("start video"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
