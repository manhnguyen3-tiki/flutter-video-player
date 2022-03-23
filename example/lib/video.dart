import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_video_player/multiaudio/HLSManifestLanguage.dart';
import 'package:flutter_video_player/multiaudio/MultiAudioSupport.dart';
import 'package:flutter_video_player/player_observer.dart';
import 'package:flutter_video_player/player_state.dart';
import 'package:flutter_video_player/video.dart';
import 'package:flutter_video_player_example/hls/getManifestLanguages.dart';

class VideoPlayout extends StatefulWidget {
  final PlayerState desiredState;
  final bool showPlayerControls;

  const VideoPlayout({Key? key, required this.desiredState, required this.showPlayerControls})
      : super(key: key);

  @override
  _VideoPlayoutState createState() => _VideoPlayoutState();
}

class _VideoPlayoutState extends State<VideoPlayout>
    with PlayerObserver, MultiAudioSupport {
  final String _url = 'https://media.w3.org/2010/05/sintel/trailer.mp4';
  List<HLSManifestLanguage> _hlsLanguages = [];
  late VideoPlayerController _videoPlayerController;
  bool _isPlaying = true;
  bool _isMute = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _getHLSManifestLanguages);
    _videoPlayerController = VideoPlayerController();
  }

  Future<void> _getHLSManifestLanguages() async {
    if (!Platform.isIOS && _url != null && _url.isNotEmpty) {
      _hlsLanguages = await getManifestLanguages(_url);
      setState(() {});
    }
  }

  void _playOrPause() {
    _isPlaying ?
        _videoPlayerController.pause()
        : _videoPlayerController.play();
    _isPlaying = !_isPlaying;
  }

  void _muteOrUnmute() {
    _isMute ?
        _videoPlayerController.unMute()
        : _videoPlayerController.mute();
    _isMute = !_isMute;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          /* player */
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Video(
              controller: _videoPlayerController,
              autoPlay: true,
              showControls: widget.showPlayerControls,
              title: "MTA International",
              subtitle: "Reaching The Corners Of The Earth",
              preferredAudioLanguage: "eng",
              isLiveStream: false,
              position: 0,
              url: _url,
              onViewCreated: _onViewCreated,
              desiredState: widget.desiredState,
              preferredTextLanguage: "en",
              loop: false,
            ),
          ),
          MaterialButton(
            child: Text(
              'play or pause',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: Colors.white),
            ),
            onPressed: _playOrPause,
          ),
          MaterialButton(
            child: Text(
              'mute or unmute',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: Colors.white),
            ),
            onPressed: _muteOrUnmute,
          ),
          /* multi language menu */
          _hlsLanguages.length < 2 && !Platform.isIOS
              ? Container()
              : Container(
                  child: Row(
                    children: _hlsLanguages
                        .map((e) => MaterialButton(
                              child: Text(
                                e.name ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(color: Colors.white),
                              ),
                              onPressed: () {
                                setPreferredAudioLanguage(e.code ?? '');
                              },
                            ))
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }

  void _onViewCreated(int viewId) {
    listenForVideoPlayerEvents(viewId);
    enableMultiAudioSupport(viewId);
  }

  @override
  void onPlay() {
    // TODO: implement onPlay
    super.onPlay();
  }

  @override
  void onPause() {
    // TODO: implement onPause
    super.onPause();
  }

  @override
  void onComplete() {
    // TODO: implement onComplete
    super.onComplete();
  }

  @override
  void onTime(int? position) {
    // TODO: implement onTime
    super.onTime(position);
  }

  @override
  void onSeek(int? position, double offset) {
    // TODO: implement onSeek
    super.onSeek(position, offset);
  }

  @override
  void onDuration(int? duration) {
    // TODO: implement onDuration
    super.onDuration(duration);
  }

  @override
  void onError(String? error) {
    // TODO: implement onError
    super.onError(error);
  }
}
