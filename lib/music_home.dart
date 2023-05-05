import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Music_House extends StatefulWidget {
  const Music_House({Key? key}) : super(key: key);

  @override
  State<Music_House> createState() => _Music_HouseState();
}

class _Music_HouseState extends State<Music_House> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Music_House"),),
        body: Column(
          children: [

          ],
        )
      ),
    );
  }
}
