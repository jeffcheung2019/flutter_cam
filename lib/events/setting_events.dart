abstract class SettingEvent {}

// Total 3 functions,
// 1: Take Photo
// 2: Take Video
// 3: Take Audio

class LanguageChanged extends SettingEvent {
  final String language;

  LanguageChanged(this.language);
}

class UsePhotoCameraMode extends SettingEvent {
  // mode:
  // 0: back camera
  // 1: front camera

  final int photoCameraMode;

  UsePhotoCameraMode(this.photoCameraMode);
}

class TakePhotoBrightnessChanged extends SettingEvent {
  final double takePhotoBrightness; // from 0 to 1

  TakePhotoBrightnessChanged(this.takePhotoBrightness);
}

class TakeVideoBrightnessChanged extends SettingEvent {
  final double takeVideoBrightness; // from 0 to 1

  TakeVideoBrightnessChanged(this.takeVideoBrightness);
}

class TakePhotoMode extends SettingEvent {
  // mode:
  // 0: manually tap to take photo
  // 1: auto take photo every x seconds for number of times

  final int photoMode;

  TakePhotoMode(this.photoMode);
}

class TakePhotoIntervalChanged extends SettingEvent {
  final int takePhotoInterval; // number of seconds

  TakePhotoIntervalChanged(this.takePhotoInterval);
}

class TakePhotoCntChanged extends SettingEvent {
  final int takePhotoCnt; // number of seconds

  TakePhotoCntChanged(this.takePhotoCnt);
}

class UseVideoCameraMode extends SettingEvent {
  // mode:
  // 0: back camera
  // 1: front camera

  final int videoCameraMode;

  UseVideoCameraMode(this.videoCameraMode);
}

class TakeVideoMode extends SettingEvent {
  // mode:
  // 0: manually tap to start recording, and tap to stop it
  // 1: take video for x seconds
  final int videoMode;

  TakeVideoMode(this.videoMode);
}

class TakeVideoTimeChanged extends SettingEvent {
  final int takeVideoTime; // number of seconds

  TakeVideoTimeChanged(this.takeVideoTime);
}

class TakeAudioTimeChanged extends SettingEvent {
  final int takeAudioTime; // number of seconds

  TakeAudioTimeChanged(this.takeAudioTime);
}

class SettingState {
  final String language;
  final int photoCameraMode;
  final int photoMode;
  final double takePhotoBrightness;
  final int takePhotoInterval;
  final int takePhotoCnt;
  final int videoCameraMode;
  final double takeVideoBrightness;
  final int videoMode;
  final int takeVideoTime;
  final int takeAudioTime;

  SettingState(
      {required this.language,
      required this.photoCameraMode,
      required this.photoMode,
      required this.takePhotoBrightness,
      required this.takePhotoInterval,
      required this.takePhotoCnt,
      required this.videoCameraMode,
      required this.takeVideoBrightness,
      required this.videoMode,
      required this.takeVideoTime,
      required this.takeAudioTime});

  SettingState copyWith(
      {String? language,
      int? photoCameraMode,
      int? photoMode,
      double? takePhotoBrightness,
      int? takePhotoInterval,
      int? takePhotoCnt,
      int? videoCameraMode,
      int? videoMode,
      double? takeVideoBrightness,
      int? takeVideoTime,
      int? takeAudioTime}) {
    return SettingState(
        language: language ?? this.language,
        photoCameraMode: photoCameraMode ?? this.photoCameraMode,
        photoMode: photoMode ?? this.photoMode,
        takePhotoBrightness: takePhotoBrightness ?? this.takePhotoBrightness,
        takePhotoInterval: takePhotoInterval ?? this.takePhotoInterval,
        takePhotoCnt: takePhotoCnt ?? this.takePhotoCnt,
        videoCameraMode: videoCameraMode ?? this.videoCameraMode,
        takeVideoBrightness: takeVideoBrightness ?? this.takeVideoBrightness,
        videoMode: videoMode ?? this.videoMode,
        takeVideoTime: takeVideoTime ?? this.takeVideoTime,
        takeAudioTime: takeAudioTime ?? this.takeAudioTime);
  }
}
