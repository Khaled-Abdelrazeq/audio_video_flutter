import 'package:audio_video_call/view_model/audio_call_view_model.dart';
import 'package:audio_video_call/view_model/video_call_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AudioCallViewModel());
    Get.lazyPut(() => VideoCallViewModel());

  }

}