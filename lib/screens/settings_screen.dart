import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_cam/blocs/setting_bloc.dart';
import 'package:secret_cam/events/setting_events.dart';

const List<String> languages = <String>['Chinese', 'English', 'Japanese'];

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _videoTimeController = TextEditingController();
  final _photoCntController = TextEditingController();
  final _photoIntervalController = TextEditingController();
  late SettingBloc _settingBloc;

  @override
  void initState() {
    super.initState();
    _settingBloc = BlocProvider.of<SettingBloc>(context);
    _videoTimeController.text = _settingBloc.state.takeVideoTime.toString();
    _photoCntController.text = _settingBloc.state.takePhotoCnt.toString();
    _photoIntervalController.text =
        _settingBloc.state.takePhotoInterval.toString();
    _videoTimeController.addListener(_onVideoTimeChanged);
    _photoCntController.addListener(_onPhotoCntChanged);
    _photoIntervalController.addListener(_onPhotoIntervalChanged);
  }

  @override
  void dispose() {
    _videoTimeController.dispose();
    _photoCntController.dispose();
    _photoIntervalController.dispose();
    _settingBloc.close();
    super.dispose();
  }

  void _onVideoTimeChanged() {
    final newVideoTime = int.tryParse(_videoTimeController.text);
    if (newVideoTime != null) {
      _settingBloc.add(TakeVideoTimeChanged(newVideoTime));
    }
  }

  void _onPhotoCntChanged() {
    final newPhotoCnt = int.tryParse(_photoCntController.text);
    if (newPhotoCnt != null) {
      _settingBloc.add(TakePhotoCntChanged(newPhotoCnt));
    }
  }

  void _onPhotoIntervalChanged() {
    final newPhotoInterval = int.tryParse(_photoIntervalController.text);
    if (newPhotoInterval != null) {
      _settingBloc.add(TakePhotoIntervalChanged(newPhotoInterval));
    }
  }

  // a function to update _settingBloc TakePhotoBrightnessChanged with value 1
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1, child: const Text("Photo Mode Brightness")),
                  ],
                ),
                Expanded(
                    flex: 2,
                    child: BlocBuilder<SettingBloc, SettingState>(
                        builder: (context, state) {
                      return Slider(
                          value: state.takePhotoBrightness,
                          max: 100,
                          divisions: 100,
                          label: state.takePhotoBrightness.round().toString(),
                          onChanged: (double value) {
                            _settingBloc.add(TakePhotoBrightnessChanged(value));
                          });
                    })),
              ],
            ),
            Stack(
              children: [
                CupertinoPicker(
                  itemExtent: 40.0, // Height of each item in the picker
                  onSelectedItemChanged: (int index) {
                    // Callback function when an item is selected
                    // Use 'index' to determine which item was selected
                  },
                  children: <Widget>[
                    // List of widgets representing each item in the picker
                    Center(
                      child: Text('Item 1'),
                    ),
                    Center(
                      child: Text('Item 2'),
                    ),
                    // Add more items as needed
                  ],
                )
              ],
            ),
            Row(
              children: [
                Expanded(flex: 1, child: const Text("Video Mode Brightness")),
                Expanded(
                    flex: 2,
                    child: BlocBuilder<SettingBloc, SettingState>(
                        builder: (context, state) {
                      return Slider(
                          value: state.takeVideoBrightness,
                          max: 100,
                          divisions: 100,
                          label: state.takeVideoBrightness.round().toString(),
                          onChanged: (double value) {
                            _settingBloc.add(TakeVideoBrightnessChanged(value));
                          });
                    })),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 1, child: const Text("Take Photo Count (s)")),
                Icon(
                  Icons.touch_app,
                ),
                Expanded(
                    flex: 2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _photoCntController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Total count of photo (s)'),
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(flex: 1, child: const Text("Take Photo Interval (s)")),
                Expanded(
                    flex: 2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _photoIntervalController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              'The amount of time interval between photos'),
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(flex: 1, child: const Text("Take Video Time (s)")),
                Expanded(
                    flex: 2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _videoTimeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'The amount of time to take video'),
                    ))
              ],
            ),
            BlocBuilder<SettingBloc, SettingState>(
              builder: (context, state) {
                return Text(
                  'takePhotoBrightness: ${state.takePhotoBrightness} \n' +
                      'takeVideoBrightness: ${state.takeVideoBrightness} \n' +
                      'photoMode: ${state.photoMode} \n' +
                      'videoMode: ${state.videoMode} \n' +
                      'takePhotoInterval: ${state.takePhotoInterval} \n' +
                      'takePhotoCnt: ${state.takePhotoCnt} \n' +
                      'takeVideoTime: ${state.takeVideoTime}',
                  style: TextStyle(fontSize: 18),
                );
              },
            ),
          ])),
    );
  }
}
