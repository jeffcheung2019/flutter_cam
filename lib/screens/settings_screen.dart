import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_cam/blocs/setting_bloc.dart';
import 'package:secret_cam/events/setting_events.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _videoTimeController = TextEditingController();
  final SettingBloc _settingBloc = SettingBloc();

  @override
  void initState() {
    super.initState();
    _videoTimeController.text = _settingBloc.state.takeVideoTime.toString();
    _videoTimeController.addListener(_onVideoTimeChanged);
  }

  @override
  void dispose() {
    _videoTimeController.dispose();
    _settingBloc.close();
    super.dispose();
  }

  void _onVideoTimeChanged() {
    final newVideoTime = int.tryParse(_videoTimeController.text);
    if (newVideoTime != null) {
      _settingBloc.add(TakeVideoTimeChanged(newVideoTime));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _videoTimeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Video Time',
                ),
              ),
              BlocBuilder<SettingBloc, SettingState>(
                builder: (context, state) {
                  return Text(
                    'Current Video Time: ${state.takeVideoTime}',
                    style: TextStyle(fontSize: 18),
                  );
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  BlocProvider.of<SettingBloc>(context).add(TakeVideoTimeChanged(22));
                },
                child: const Text('ABC'),
              )
            ]
          )),
    );
  }
}
