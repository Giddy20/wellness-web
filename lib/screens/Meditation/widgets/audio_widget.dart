
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wellness_flow_admin/screens/Meditation/widgets/edit_meditation_audio_dialog.dart';

import '../../../helpers/audio_player.dart';
import '../../../src/constants.dart';
import 'delete_meditation_dialog.dart';


class AudioWidget extends StatefulWidget {
  var audio;
   AudioWidget({super.key, this.audio});

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.paused;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
      Future<Duration?> duration = audioPlayer.getDuration();
      print(duration.toString());
    });


    audioPlayer.setSourceUrl(widget.audio['audio'].toString()).then((value) => audioPlayer.getDuration());
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
        print(audioDuration.toString());
      });
    });

    audioPlayer.onPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stop(audioPlayer);
    audioPlayer.dispose();
    audioPlayer.stop();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
      decoration: BoxDecoration(
          color: bgLightColor,
          borderRadius: BorderRadius.circular(12.sp)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              child: Container(
                // width: width() * 0.08,
                height: height(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  image: DecorationImage(
                    image:  Image.network(widget.audio['image'].toString(), width: 100.sp, ).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),),
          ),
          horizontalSpace(0.01),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width() * 0.09,
                          child: Text(widget.audio['title'],
                            overflow: TextOverflow.ellipsis,
                            style: poppinsTextFont.copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600
                            ),),
                        ),
                        tinyHSpace(),
                        PopupMenuButton(
                          color: bgLightColor,
                          onSelected: (item) {
                            print(item);
                            if(item == 0){
                              editMeditationAudio(context,
                                title: widget.audio['title'],
                                description: "",
                                audioType: widget.audio['meditation_type'],
                                image: widget.audio['image'],
                                audio: widget.audio['audio'],
                              );
                            } else{
                              // deleteMeditationAudio(context, id: widget.audio['id']);
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(value: 0, child: Text('Edit')),
                            PopupMenuItem(value: 1, child: Text('Delete')),
                          ],
                        ),
                        // Icon(Icons.more_vert, color: Colors.white, size: 12.sp,),

                      ],
                    ),
                    tinySpace(),
                    Text("Type : ${widget.audio['meditation_type']}",
                      style: poppinsTextFont.copyWith(
                        fontSize: 10.sp,
                      ),),
                    tinySpace(),
                    Text("Created on: ${DateFormat('dd/MM/yy').format(DateTime.parse(widget.audio['uploaded_at']))}",
                      style: poppinsTextFont.copyWith(
                        fontSize: 8.sp,
                      ),),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    audioDuration != 1 ? InkWell(
                      onTap: () async{
                        setState(() {
                          if(audioStatus == ""){
                            statusIcon = Pause(buttonColor: Color(0xFFDADADA));
                            play(widget.audio['audio'].toString(), audioPlayer);
                            audioStatus = "Playing";
                          }else if(audioStatus == "Playing"){
                            pause(audioPlayer);
                            audioStatus = "";
                            statusIcon = Play(buttonColor: Colors.teal);
                          }
                        });
                      },
                      child: statusIcon,
                    ) : SizedBox(width: 9.sp,height: 9.sp, child: CircularProgressIndicator(strokeWidth: 1, color: Colors.white,)),
                    horizontalSpace(0.005),
                    SizedBox(
                      // width: width() * 0.06,
                      child: audioSlider(context, audioPlayer),
                    ),

                    Text(getTimeRemainingString(),
                      style: poppinsTextFont.copyWith(
                          fontSize: 6.sp
                      ),),
                  ],
                ),


              ],
            ),
          )
        ],
      ),
    );
  }
}

