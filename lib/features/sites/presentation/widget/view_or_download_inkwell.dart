import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiwayda_oracion_islamica/core/constants/app_colors.dart';
import 'package:hiwayda_oracion_islamica/core/services/download_services.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewOrDownloadInkwell extends StatelessWidget {
  ViewOrDownloadInkwell(
      {super.key,
      required this.url,
      required this.name,
      this.fileType = '',
      this.mediaLinkType = MediaLinkType.viewAndDownload}) {
    if (mediaLinkType == MediaLinkType.downloadOnly ||
        mediaLinkType == MediaLinkType.viewAndDownload ||
        mediaLinkType == MediaLinkType.downloadAndListen) {
      _downloadServices = Get.find();
    }
  }

  final MediaLinkType mediaLinkType;
  final String url;
  final String name;
  final String fileType;
  late final DownloadServices _downloadServices;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (mediaLinkType == MediaLinkType.downloadOnly) {
          _download();
        } else {
          _view();
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
        decoration: BoxDecoration(
            color: AppColors.kGreenColor,
            border: Border.all(color: AppColors.kGreenColor),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                    color: AppColors.kGoldenColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              color: AppColors.kWhiteColor,
              width: 1,
              height: 40,
            ),
            if (mediaLinkType == MediaLinkType.downloadOnly ||
                mediaLinkType == MediaLinkType.viewAndDownload ||
                mediaLinkType == MediaLinkType.downloadAndListen)
              IconButton(
                  onPressed: _download,
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  )),
            if (mediaLinkType == MediaLinkType.viewAndDownload ||
                mediaLinkType == MediaLinkType.viewOnly)
              IconButton(
                  onPressed: _view,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  )),
            if (mediaLinkType == MediaLinkType.downloadAndListen)
              _AudioPlayerWidget(url)
          ],
        ),
      ),
    );
  }

  _download() {
    _downloadServices.download(url: url, fileName: "$name.$fileType");
  }

  _view() {
    launchUrl(Uri.parse(url));
  }
}

enum MediaLinkType {
  downloadOnly,
  viewOnly,
  viewAndDownload,
  downloadAndListen
}

class _AudioPlayerWidget extends StatefulWidget {
  const _AudioPlayerWidget(this.url);
  final String url;
  @override
  State<_AudioPlayerWidget> createState() => __AudioPlayerWidgetState();
}

class __AudioPlayerWidgetState extends State<_AudioPlayerWidget> {
  IconData _icon = Icons.play_arrow;
  bool _initlized = false;
  late AudioPlayer _player;
  bool _loading = false;
  late StreamSubscription<PlayerState> _listener;
  strartLisiner() {
    _listener = _player.onPlayerStateChanged.listen((state) {
      switch (state) {
        case PlayerState.playing:
          _icon = Icons.pause;
          break;
        case PlayerState.paused:
          _icon = Icons.play_arrow;
          break;
        case PlayerState.completed:
          _icon = Icons.play_arrow;
          break;
        default:
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _player.dispose();
    try {
      _listener.cancel();
    } catch (e) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const CircularProgressIndicator(color: Colors.white)
        : IconButton(
            icon: Icon(
              _icon,
              color: Colors.white,
            ),
            onPressed: () async {
              if (!_initlized) {
                _player = AudioPlayer();
                _initlized = true;

                _player.setReleaseMode(ReleaseMode.stop);
                setState(() {
                  _loading = true;
                });
                strartLisiner();
                await _player.play(UrlSource(widget.url));
                if (mounted) {
                  setState(() {
                    _loading = false;
                  });
                }
              } else {
                if (_icon == Icons.play_arrow) {
                  // if (_player.state == PlayerState.completed) {
                  //   _player.play(UrlSource(widget.url));
                  // } else {
                  // }
                  _player.resume();
                } else {
                  _player.pause();
                }
              }
            },
          );
  }
}
