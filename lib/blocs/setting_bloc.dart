import 'package:secret_cam/events/setting_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc()
      : super(SettingState(
            takePhotoBrightness: 0,
            takeVideoBrightness: 0,
            photoMode: 0,
            videoMode: 0,
            takePhotoInterval: 10,
            takePhotoCnt: 5,
            takeVideoTime: 30));

  @override
  Stream<SettingState> mapEventToState(SettingEvent event) async* {
    if (event is TakePhotoBrightnessChanged) {
      yield state.copyWith(takePhotoBrightness: event.takePhotoBrightness);
    } else if (event is TakeVideoBrightnessChanged) {
      yield state.copyWith(takeVideoBrightness: event.takeVideoBrightness);
    } else if (event is TakePhotoMode) {
      yield state.copyWith(photoMode: event.photoMode);
    } else if (event is TakePhotoSettingChanged) {
      yield state.copyWith(
          takePhotoInterval: event.takePhotoInterval,
          takePhotoCnt: event.takePhotoCnt);
    } else if (event is TakeVideoMode) {
      yield state.copyWith(videoMode: event.videoMode);
    } else if (event is TakeVideoTimeChanged) {
      yield state.copyWith(takeVideoTime: event.takeVideoTime);
    }
  }
}
