import 'package:secret_cam/events/setting_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//https://verygood.ventures/blog/how-to-use-bloc-with-streams-and-concurrency
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc()
      : super(SettingState(
            language: "English",
            photoCameraMode: 0,
            photoMode: 0,
            takePhotoBrightness: 0,
            takePhotoInterval: 10,
            takePhotoCnt: 5,
            videoCameraMode: 0,
            videoMode: 0,
            takeVideoBrightness: 0,
            takeVideoTime: 30,
            takeAudioTime: 30)) {
    on<LanguageChanged>(
        (event, emit) => emit(state.copyWith(language: event.language)));
    on<UsePhotoCameraMode>((event, emit) =>
        emit(state.copyWith(photoCameraMode: event.photoCameraMode)));
    on<TakePhotoMode>(
        (event, emit) => emit(state.copyWith(photoMode: event.photoMode)));
    on<TakePhotoBrightnessChanged>((event, emit) =>
        emit(state.copyWith(takePhotoBrightness: event.takePhotoBrightness)));
    on<TakePhotoIntervalChanged>((event, emit) =>
        emit(state.copyWith(takePhotoInterval: event.takePhotoInterval)));
    on<TakePhotoCntChanged>((event, emit) =>
        emit(state.copyWith(takePhotoCnt: event.takePhotoCnt)));

    on<TakeVideoMode>(
        (event, emit) => emit(state.copyWith(videoMode: event.videoMode)));
    on<TakeVideoBrightnessChanged>((event, emit) =>
        emit(state.copyWith(takeVideoBrightness: event.takeVideoBrightness)));
    on<TakeVideoTimeChanged>((event, emit) =>
        emit(state.copyWith(takeVideoTime: event.takeVideoTime)));
    on<TakeAudioTimeChanged>((event, emit) =>
        emit(state.copyWith(takeAudioTime: event.takeAudioTime)));
  }
}
