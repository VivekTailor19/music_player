import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MusicPlayerProvider extends ChangeNotifier
{
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool ismusic = false;

  void initmusic()
  {
    audioPlayer.open(Audio("assets/audio/zindagi.mp3"),autoStart: false,showNotification: true,);
    notifyListeners();

  }

  void musicrun()
  {
    if(ismusic == true)
    {
      audioPlayer.play();
    }
    else
    {
     audioPlayer.pause();
    }
  }
  void pausemusic()
  {
    ismusic = true;
    audioPlayer.pause();
    notifyListeners();

  }
  void playmusic()
  {
    ismusic = false;
    audioPlayer.play();
    notifyListeners();
  }



}