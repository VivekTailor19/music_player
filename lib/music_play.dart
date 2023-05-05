

import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'music_provider.dart';


class Music_Play extends StatefulWidget {
  const Music_Play({Key? key}) : super(key: key);

  @override
  State<Music_Play> createState() => _Music_PlayState();
}

class _Music_PlayState extends State<Music_Play> {

  MusicPlayerProvider? mppT;
  MusicPlayerProvider? mppF;

  @override
  void initState() {
    Provider.of<MusicPlayerProvider>(context,listen: false).initmusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    mppT = Provider.of<MusicPlayerProvider>(context,listen: true);
    mppF = Provider.of<MusicPlayerProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://c.saavncdn.com/411/Zindagi-Aa-Raha-Hoon-Main-Hindi-2015-500x500.jpg"),
                      fit: BoxFit.fill,
                  opacity: 0.5)),
            ),
            Align(
              alignment: Alignment(0, 0.85),
              child: PlayerBuilder.currentPosition(
                player: mppF!.audioPlayer,
                builder: (context, position) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Slider(
                        activeColor: Colors.red.shade900,
                        inactiveColor: Colors.lightGreen,
                        max: mppT!.musictime.inSeconds.toDouble(),
                        thumbColor: Colors.red,
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) {

                          position = Duration(seconds: value.toInt());
                          mppF!.audioPlayer.seek(position);


                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${position.inSeconds}",style: TextStyle(fontSize: 15,color: Colors.teal),),
                            Text("${mppT!.musictime.inSeconds}",style: TextStyle(color: Colors.teal),),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.loop,
                                color: Colors.amber.shade900,
                              )),
                          IconButton(
                              onPressed: () {
                                mppF!.playpreviews();
                                },
                              icon: Icon(
                                Icons.skip_previous,
                                color: Colors.amber.shade900,
                              )),
                          FloatingActionButton(
                            onPressed: () {
                              mppF!.musicrun();

                            },
                            child: Icon(
                              mppT!.ismusic ? Icons.play_arrow_rounded : Icons.pause,
                              color: Colors.white,
                            ),
                            backgroundColor: Colors.amber.shade900,
                          ),
                          IconButton(
                              onPressed: () {
                                mppF!.playnext();
                              },
                              icon: Icon(
                                Icons.skip_next,
                                color: Colors.amber.shade900,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.amber.shade900,
                              )),
                        ],
                      ),
                    ],
                  );
                },


              ),
            ),

            Align(
              alignment: Alignment(0, 0),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i1.sndcdn.com/artworks-000116063521-6rhvmq-t500x500.jpg"),
                        fit: BoxFit.fill)),
              ),
            )
          ],
        ),
      ),
    );
  }
}




// if(mppF!.audioPlayer.isPlaying.value)
// {
//   mppF!.pausemusic();
// }
// else
// {
//   mppF!.playmusic();
// }