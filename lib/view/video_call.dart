import 'package:audio_video_call/helper/agora_settings.dart';
import 'package:audio_video_call/view_model/video_call_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;


class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<VideoCallViewModel>(
              init: VideoCallViewModel(),
              builder: (controller) {
                return Center(
                  child: _renderRemoteVideo(controller, context),
                );
              }
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: SizedBox(
                  width: 150, height: 150,
                  child: _renderLocalPreview(),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GetBuilder<VideoCallViewModel>(
                      builder: (controller) {
                        return IconButton(onPressed: (){
                          controller.disposeCall();
                          Get.back();
                        }, icon: const Icon(Icons.call_end, size: 44, color: Colors.redAccent,));
                      }
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderLocalPreview(){
    return const RtcLocalView.SurfaceView();
  }

  Widget _renderRemoteVideo(VideoCallViewModel controller, BuildContext context){
    if(controller.remoteUId != 0){
      print('Now Show app');
      return RtcRemoteView.SurfaceView(uid: controller.remoteUId, channelId: AgoraSettings.CHANNEL_NAME,);
    }else{
      return Text('Calling...', style:
        Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
     );
    }
  }
}
