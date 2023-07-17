import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_vlc_player/android_vlc_player.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('VLC Plugin Example'),
          ),
          body: const MyApp(),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _androidVlcPlayerPlugin = AndroidVlcPlayer();
  bool? _vlc;
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _mimeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  Future<void> vlc({
    required String file,
    required String mimeType,
    required String title,
  }) async {
    bool vlc;
    try {
      vlc = await _androidVlcPlayerPlugin.startVLCPlayer(
            file: file,
            mimeType: mimeType,
            title: title,
          ) ??
          false;
    } on PlatformException {
      vlc = false;
    }

    setState(() {
      _vlc = vlc;
    });
  }

  @override
  void initState() {
    super.initState();
    _videoController.clear();
    _mimeController.clear();
    _titleController.clear();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _mimeController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('is VLC installed: ${_vlc.toString()}\n'),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  controller: _videoController,
                  decoration: const InputDecoration(
                    hintText: "Video Url",
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (url) {
                    if (url.isNotEmpty) {
                      _videoController.text = url;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  controller: _mimeController,
                  decoration: const InputDecoration(
                    hintText: "Mime Type",
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (mime) {
                    if (mime.isNotEmpty) {
                      _mimeController.text = mime;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: "Title ",
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (title) {
                    if (title.isNotEmpty) {
                      _titleController.text = title;
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_videoController.value.text.isNotEmpty &&
                      _mimeController.value.text.isNotEmpty &&
                      _titleController.value.text.isNotEmpty) {
                    vlc(
                      file: _videoController.value.text,
                      mimeType: _mimeController.value.text,
                      title: _titleController.value.text,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Enter Video data To Start VLC"),
                      ),
                    );
                  }
                },
                child: const Text("start VLC"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4
//video/*
//test
