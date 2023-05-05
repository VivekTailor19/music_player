import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'musicmodel.dart';

class MusicPlayerProvider extends ChangeNotifier
{

  int? number;


  List<MusicModel> musicItems =[
    MusicModel(name: "Zindagi",path: Audio("assets/audio/zindagi.mp3")),
    MusicModel(name: "Machayenge",path: Audio("assets/audio/machayenge.mp3")),
  ];


  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  bool ismusic = false;

  void initmusic(int number)
  {
    audioPlayer.open(Playlist(
      audios: [
      Audio("assets/audio/zindagi.mp3"),
      Audio("assets/audio/machayenge.mp3"),
    ],startIndex: number
    ),autoStart: false,showNotification: true,loopMode: LoopMode.playlist);
    musiclength();
  }

  Duration musictime = Duration(seconds: 0);

  void musiclength()
  {
    audioPlayer.current.listen((event)
    {
      musictime = event!.audio.duration;
      notifyListeners();
    });
  }

  void musicseek()
  {

  }

  void musicrun()
  {
    if(audioPlayer.isPlaying.value)
    {
      pausemusic();
    }
    else
    {
      playmusic();
    }

  }
  void pausemusic()
  {
    audioPlayer.pause();
    ismusic = true;
    notifyListeners();
  }

  void playmusic()
  {
    audioPlayer.play();
    ismusic = false;
    notifyListeners();

  }

  void playnext()
  {
    audioPlayer.next();
  }
  void playpreviews()
  {
    audioPlayer.next();
  }



}