import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'music_provider.dart';

class Music_House extends StatefulWidget {
  const Music_House({Key? key}) : super(key: key);

  @override
  State<Music_House> createState() => _Music_HouseState();
}

class _Music_HouseState extends State<Music_House> {

  MusicPlayerProvider? mppT;
  MusicPlayerProvider? mppF;


  @override
  Widget build(BuildContext context) {

    mppT = Provider.of<MusicPlayerProvider>(context,listen: true);
    mppF = Provider.of<MusicPlayerProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Music_House"),),
        body: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "musicitem",arguments: index);
              },
              child: Container(
                height: 150,width: 150,
                color: Colors.lightBlueAccent.shade100,
                alignment: Alignment.center,
                child: Text("${mppT!.musicItems[index].name}",style: TextStyle(fontSize: 15),),
              ),
            ),
          );

        },
        scrollDirection: Axis.vertical,
        itemCount: mppF!.musicItems.length,)
        )

    );
  }
}
