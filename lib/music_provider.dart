import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'musicmodel.dart';

class MusicPlayerProvider extends ChangeNotifier
{



  List<MusicModel> milist =[
    MusicModel(name: "Zindagi",path: Audio("assets/audio/zindagi.mp3")),
    MusicModel(name: "Machayenge",path: Audio("assets/audio/machayenge.mp3")),
  ];
  int temp = 0;



  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  int mno = 0;

  bool ismusic = false;

  void initmusic()
  {
    audioPlayer.open(Playlist(
      audios: [
      Audio("assets/audio/zindagi.mp3"),
      Audio("assets/audio/machayenge.mp3"),
    ],startIndex:mno
    ),autoStart: false,showNotification: true,loopMode: LoopMode.playlist);
    musiclength();
    temp = mno;
    notifyListeners();
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
    // temp = mno++;
    // notifyListeners();
    audioPlayer.next();
  }
  void playpreviews()
  {
    // temp = mno--;
    // notifyListeners();
    audioPlayer.next();
  }



}