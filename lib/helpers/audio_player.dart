

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_flow_admin/src/constants.dart';


Source? source;

String audioStatus = "";

int timeProgress = 0;
int audioDuration = 1;

Widget statusIcon = Play(buttonColor: Colors.teal);

bool isLoading = false;

play(url, player) async {
  // Add the parameter "isLocal: true" if you want to access a local file
  await player.play(UrlSource(url), volume: 1);
  player.setVolume(1);
}

/// Compulsory
pause(player) async {
  await player.pause();
}

stop(player) async{
  await player.stop();
  player.dispose();
}


String getTimeString(int seconds) {
  String minuteString =
      '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
  String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
  return '$minuteString:$secondString'; // Returns a string with the format mm:ss
}

String getTimeRemainingString() {
  var timeRemaining = (timeProgress);
  String minute =
      '${(timeRemaining / 60).floor() < 10 ? 0 : ''}${(timeRemaining / 60).floor()}';
  String second = '${timeRemaining % 60 < 10 ? 0 : ''}${timeProgress % 60}';
  return '$minute:$second'; // Returns a string with the format mm:ss
}

Widget audioSlider(context, player) {
  return Container(
    width: width() * 0.08,
    child: SliderTheme(
      data: SliderThemeData(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0, disabledThumbRadius: 8),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 8.0),),
      child: Slider(
          value: timeProgress.toDouble(),
          min: 0,
          max: audioDuration.toDouble(),
          inactiveColor: Color(0xFFD8D8D8),
          thumbColor: Colors.white,
          onChanged: (value) {
            seekToSec(player, value.toInt());
          }),
    ),
  );
}



void seekToSec(player, int sec) {
  Duration newPos = Duration(seconds: sec);
  player
      .seek(newPos); // Jumps to the given position within the audio file
}

class Pause extends StatelessWidget {
  const Pause({
    super.key,
    required this.buttonColor,
  });

  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.pause, size: 10.sp, color: Colors.white,)
    );
  }
}


class Play extends StatelessWidget {
  const Play({
    super.key,
    required this.buttonColor,
  });

  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.play_arrow, size: 10.sp, color: Colors.white,)
    );
  }
}