import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class MusicProvider extends ChangeNotifier {
  MusicProvider();

  final AudioPlayer _music = AudioPlayer(playerId: "login/register");
  bool playing = false;

  AudioPlayer get audios {
    return _music;
  }

  void play() async {
    _music.setReleaseMode(ReleaseMode.loop);
    await _music.play(AssetSource("music/caparrots.mp3"));
    playing = true;
  }

  void play2() async {
    _music.setReleaseMode(ReleaseMode.loop);
    await _music.play(AssetSource("music/homepagesong.mp3"));
    playing = true;
  }

  void stop() async {
    await _music.stop();
    playing = false;
  }

  void volumenOff() async {
    await _music.setVolume(0);
    playing = false;
  }

  void volumeOn() async {
    await _music.setVolume(1);
    playing = true;
  }

  void resumeMusic() async {
    await _music.resume();
    playing = true;
  }

  void pauseMusic() async {
    await _music.pause();
    playing = false;
  }
}
