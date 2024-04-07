import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_cam/blocs/setting_bloc.dart';
import 'package:secret_cam/events/setting_events.dart';

class MediaLibraryScreen extends StatefulWidget {
  MediaLibraryScreen({super.key});

  @override
  State<MediaLibraryScreen> createState() => _MediaLibraryScreenState();
}

class _MediaLibraryScreenState extends State<MediaLibraryScreen> {
  late SettingBloc _settingBloc;

  @override
  void initState() {
    super.initState();
    _settingBloc = BlocProvider.of<SettingBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
          child: Column(
        children: [
          BlocBuilder<SettingBloc, SettingState>(
            bloc: _settingBloc,
            builder: (context, state) {
              return Text(
                'Current Video Time: ${state.takeVideoTime}',
                style: TextStyle(fontSize: 18),
              );
            },
          )
        ],
      )),
    );
  }
}
