abstract class SettingEvent {}

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

class TakePhotoSettingChanged extends SettingEvent {
  final int takePhotoInterval; // number of seconds
  final int takePhotoCnt; // number of seconds

  TakePhotoSettingChanged(this.takePhotoInterval, this.takePhotoCnt);
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

class SettingState {
  final double takePhotoBrightness;
  final double takeVideoBrightness;
  final int photoMode;
  final int videoMode;
  final int takePhotoInterval;
  final int takePhotoCnt;
  final int takeVideoTime;

  SettingState(
      {required this.takePhotoBrightness,
      required this.takeVideoBrightness,
      required this.photoMode,
      required this.videoMode,
      required this.takePhotoInterval,
      required this.takePhotoCnt,
      required this.takeVideoTime});

  SettingState copyWith(
      {double? takePhotoBrightness,
      double? takeVideoBrightness,
      int? photoMode,
      int? videoMode,
      int? takePhotoInterval,
      int? takePhotoCnt,
      int? takeVideoTime}) {
    return SettingState(
        takePhotoBrightness: takePhotoBrightness ?? this.takePhotoBrightness,
        takeVideoBrightness: takeVideoBrightness ?? this.takeVideoBrightness,
        photoMode: photoMode ?? this.photoMode,
        videoMode: videoMode ?? this.videoMode,
        takePhotoInterval: takePhotoInterval ?? this.takePhotoInterval,
        takePhotoCnt: takePhotoCnt ?? this.takePhotoCnt,
        takeVideoTime: takeVideoTime ?? this.takeVideoTime);
  }
}
