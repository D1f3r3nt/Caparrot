import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class MusicProvider extends ChangeNotifier {
  MusicProvider();

  AudioPlayer _music = AudioPlayer(playerId: "login/register");

  AudioPlayer get audios {
    return _music;
  }

  void play() async {
    _music.setReleaseMode(ReleaseMode.loop);
    await _music.play(AssetSource("caparrots.mp3"));
  }

  void play2() async {
    _music.setReleaseMode(ReleaseMode.loop);
    await _music.play(AssetSource("homepagesong.mp3"));
  }

  void stop() async {
    await _music.stop();
  }

  void volumenOff() async {
    await _music.setVolume(0);
  }

  void volumeOn() async {
    await _music.setVolume(1);
  }
}
