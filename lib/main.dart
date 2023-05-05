import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'music_home.dart';
import 'music_play.dart';
import 'music_provider.dart';

void main() {
  runApp(

      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MusicPlayerProvider(),),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => Music_House(),
            "musicitem":(context) => Music_Play(),
          },
        ),
      ),

  );
}
