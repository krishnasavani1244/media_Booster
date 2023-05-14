import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/views/screen/Home_page.dart';
import 'package:media_booster/views/screen/audio_player.dart';
import 'globals/globals.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => Home_page(),
        'audio_player' : (context) => audio_player(),

      },
    ),
  );
}




