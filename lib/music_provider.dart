import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MusicPlayerProvider extends ChangeNotifier
{
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  void initmusic()
  {
    audioPlayer.open(Audio("assets/audio/zindagi.mp3"),autoStart: false,showNotification: true,);
    notifyListeners();

  }
  void pausemusic()
  {
    audioPlayer.pause();

  }
  void playmusic()
  {
    audioPlayer.play();
  }



}