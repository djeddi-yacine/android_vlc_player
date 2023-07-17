![Image](https://i.imgur.com/31NlpIZ.gif)

## Features

- Launch VLC Player from Your Flutter App
- Work on Any android Device That run VLC

## Supported Mime Type
- video/*
- audio/*
- */rmvb
- */avi
- */mkv
- application/3gpp*
- application/mp4
- application/mpeg*
- application/ogg
- application/sdp
- application/vnd.3gp*
- application/vnd.apple.mpegurl
- application/vnd.dvd*
- application/vnd.dolby*
- application/vnd.rn-realmedia*
- application/x-iso9660-image
- application/x-extension-mp4
- application/x-flac
- application/x-matroska
- application/x-mpegURL
- application/x-ogg
- application/x-quicktimeplayer
- application/x-shockwave-flash
- application/xspf+xml
- misc/ultravox
- 
## Installation

Run This to install the package .
```sh
flutter pub add android_vlc_player
```

## How To Use It
Create new instance of AndroidVLCPlayer class
```dart
    final _androidVlcPlayer = AndroidVlcPlayer();
```
To start the player
```dart
    _androidVlcPlayer.startVLCPlayer(
        file: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        mimeType: "video/*",
        title: "Test",
    );
```

see The Example App.

## LICENSE
```
BSD 3-Clause License

Copyright (c) 2023 Djeddi Yacine
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```