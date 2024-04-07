import 'package:secret_cam/events/setting_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//https://verygood.ventures/blog/how-to-use-bloc-with-streams-and-concurrency
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc()
      : super(SettingState(
            takePhotoBrightness: 0,
            takeVideoBrightness: 0,
            photoMode: 0,
            videoMode: 0,
            takePhotoInterval: 10,
            takePhotoCnt: 5,
            takeVideoTime: 30)) {
    on<TakePhotoBrightnessChanged>((event, emit) =>
        emit(state.copyWith(takePhotoBrightness: event.takePhotoBrightness)));
    on<TakeVideoBrightnessChanged>((event, emit) =>
        emit(state.copyWith(takeVideoBrightness: event.takeVideoBrightness)));
    on<TakePhotoMode>(
        (event, emit) => emit(state.copyWith(photoMode: event.photoMode)));
    on<TakePhotoSettingChanged>((event, emit) => emit(state.copyWith(
        takePhotoInterval: event.takePhotoInterval,
        takePhotoCnt: event.takePhotoCnt)));
    on<TakeVideoMode>(
        (event, emit) => emit(state.copyWith(videoMode: event.videoMode)));
    on<TakeVideoTimeChanged>((event, emit) =>
        emit(state.copyWith(takeVideoTime: event.takeVideoTime)));
  }
}
