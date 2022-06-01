import 'package:audio_video_call/view/audio_call.dart';
import 'package:audio_video_call/view/video_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){
                  Get.to(() => const AudioCallScreen());
                }, icon: const Icon(Icons.call, size: 60, color: Colors.green,)),
                IconButton(onPressed: (){
                  Get.to(() => const VideoCallScreen());
                }, icon: const Icon(Icons.video_call, size: 60, color: Colors.green,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
