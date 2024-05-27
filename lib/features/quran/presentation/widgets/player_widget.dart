import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/features/quran/controller/telawa_controller.dart';
import 'package:hiwayda_oracion_islamica/features/quran/presentation/controller/quran_controller.dart';

import '../../../../core/constants/app_colors.dart';

class PlayerWidget extends StatefulWidget {
  final int chapterNumber;

  const PlayerWidget({required this.chapterNumber, super.key});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;

  int ayaAudioIndex = 0;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState == PlayerState.playing;

  AudioPlayer player = AudioPlayer();
  List<String> ayatUrls = [];

  @override
  void initState() {
    super.initState();
    player.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (ayatUrls.isEmpty) {
        await Get.find<TelawaController>()
            .getAyatAudio(widget.chapterNumber)
            .then((value) async {
          ayatUrls.addAll(Get.find<TelawaController>().audioUrls);
          await player.setSource(
              UrlSource('https://verses.quran.com/${ayatUrls[ayaAudioIndex]}'));
        });
      }
    });

    // Use initial values from player
    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {
            _duration = value;
          }),
        );
    player.getCurrentPosition().then(
          (value) => setState(() {
            _position = value;
          }),
        );
    _initStreams();
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  @override
  void deactivate() {
    _pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: ayaAudioIndex > 0
                ? () {
                    _playerState = PlayerState.stopped;
                    _position = Duration.zero;
                    ayaAudioIndex--;
                    _updateSource();
                    setState(() {
                      _play();
                    });
                  }
                : null,
            disabledColor: AppColors.gray,
            color: AppColors.kBlackColor,
            icon: const Icon(
              Icons.skip_previous,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () async {
              if (_isPlaying) {
                _pause();
              } else {
                _play();
              }
            },
            icon: _isPlaying
                ? const Icon(
                    Icons.pause,
                    size: 32,
                    color: AppColors.kBlackColor,
                  )
                : const Icon(
                    Icons.play_arrow,
                    size: 32,
                    color: AppColors.kBlackColor,
                  ),
          ),
          IconButton(
            onPressed: (ayaAudioIndex < ayatUrls.length - 1)
                ? () async {
                    await _stop();
                    ayaAudioIndex++;
                    _updateSource();
                    setState(() {
                      /*_playerState = PlayerState.stopped;
                      _position = Duration.zero;*/
                      _play();
                    });
                  }
                : null,
            disabledColor: AppColors.gray,
            color: AppColors.kBlackColor,
            icon: const Icon(
              Icons.skip_next,
              size: 32,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 8,
      ),
      SizedBox(
        height: 1,
        child: Slider(
          activeColor: AppColors.black,
          inactiveColor: AppColors.black,
          thumbColor: AppColors.kGoldenColor,
          value: (_position != null &&
                  _duration != null &&
                  _position!.inMilliseconds > 0 &&
                  _position!.inMilliseconds < _duration!.inMilliseconds)
              ? (_position!.inMilliseconds / _duration!.inMilliseconds)
              : 0.0,
          onChanged: (value) {
            final duration = _duration;
            if (duration == null) {
              return;
            }
            final position = value * duration.inMilliseconds;
            player.seek(Duration(milliseconds: position.round()));
          },
        ),
      ),
    ]);
  }

  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
      ayaAudioIndex++;
      setState(() {
        if (ayaAudioIndex < ayatUrls.length) {
          _updateSource();
          _play();
        } else {
          _end();
        }
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  Future<void> _play() async {
    await player.resume();
    Get.find<QuranController>().updatePlayState(true);
    Get.find<QuranController>().updateCurrentPlayingState(ayaAudioIndex);
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    await player.pause();
    Get.find<QuranController>().updatePlayState(false);
    setState(() => _playerState = PlayerState.paused);
  }

  Future<void> _stop() async {
    await player.stop();
    Get.find<QuranController>().updatePlayState(false);
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }

  Future<void> _end() async {
    await player.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
      ayaAudioIndex = 0;
    });
    Get.find<QuranController>().updatePlayState(false);
    Get.find<QuranController>().updateCurrentPlayingState(ayaAudioIndex);
  }

  void _updateSource() {
    player.setSource(
        UrlSource('https://verses.quran.com/${ayatUrls[ayaAudioIndex]}'));
  }
}
