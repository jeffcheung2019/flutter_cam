import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_cam/blocs/setting_bloc.dart';
import 'package:secret_cam/events/setting_events.dart';

class MediaLibraryScreen extends StatefulWidget {

  MediaLibraryScreen({super.key});

  State<MediaLibraryScreen> createState() => _MediaLibraryScreenState();
}

class _MediaLibraryScreenState extends State<MediaLibraryScreen> {
  final SettingBloc _settingBloc = SettingBloc();

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
        )
      ),
    );
  }
}
