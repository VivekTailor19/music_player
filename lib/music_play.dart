

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/music_provider.dart';
import 'package:provider/provider.dart';


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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.loop,
                        color: Colors.amber.shade900,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous,
                        color: Colors.amber.shade900,
                      )),
                  FloatingActionButton(
                    onPressed: () {
                      mppF!.audioPlayer.play();
                    },
                    child: Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.amber.shade900,
                  ),
                  IconButton(
                      onPressed: () {},
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
