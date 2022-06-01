import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:audio_video_call/helper/agora_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallViewModel extends GetxController{
  int _remoteUId = 0;
  int get remoteUId => _remoteUId;
  RtcEngine? _engine;

  VideoCallViewModel(){
    initAgora();
  }

  @override
  void dispose() {
    _engine?.leaveChannel();
    super.dispose();
  }

  disposeCall(){
    _engine?.leaveChannel();
  }

  Future<void> initAgora() async{
    await [Permission.microphone, Permission.camera].request();
    _engine = await RtcEngine.create(AgoraSettings.APP_ID);
    _engine?.enableVideo();
    _engine?.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed){
          if(kDebugMode) debugPrint('local user $uid joined successfully!');
        },

        userJoined: (int uid, int elapsed){
          if(kDebugMode) debugPrint('remote user $uid joined successfully!');
          _remoteUId = uid;
          update();
          print('remoteUId $remoteUId');
        },

        userOffline: (int uid, UserOfflineReason reason){
          if(kDebugMode) debugPrint('remote user $uid left call!');
          _remoteUId = 0;
          update();
          Get.back();
        }
      )
    );

    await _engine?.joinChannel(AgoraSettings.TEMP_TOKEN, AgoraSettings.CHANNEL_NAME, null, 0);
  }
}