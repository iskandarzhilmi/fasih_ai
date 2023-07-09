import 'dart:io';

import 'package:fasih_ai/src/features/recitation/presentation/submit_audio_controller.dart';
import 'package:fasih_ai/src/features/recitation/presentation/verse_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:fasih_ai/src/common_widgets/async_value_widget.dart';
import 'package:fasih_ai/src/common_widgets/empty_placeholder_widget.dart';
import 'package:fasih_ai/src/features/recitation/data/verse_repository.dart';
import 'package:fasih_ai/src/features/recitation/domain/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class VerseListScreen extends ConsumerStatefulWidget {
  const VerseListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => VerseListScreenState();
}

class VerseListScreenState extends ConsumerState<VerseListScreen> {
  late final AudioPlayer _audioPlayer;
  final _audioRecorder = Record();
  RecordState _recordState = RecordState.stop;
  Verse? _selectedVerse;
  String? audioPath;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          final verseListValue = ref.watch(versesListStreamProvider);

          return AsyncValueWidget<List<Verse>>(
            value: verseListValue,
            data: (verses) => verses.isEmpty
                ? const EmptyPlaceholderWidget(
                    message: 'No verses found',
                  )
                : ListView.builder(
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return VerseListItem(
                        verse: verses[index],
                        audioPlayer: _audioPlayer,
                        isSelected: verses[index] == _selectedVerse,
                        onTap: () {
                          setState(() {
                            _selectedVerse = verses[index];
                          });
                        },
                      );
                    },
                  ),
          );
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: () async {
            if (_selectedVerse != null) {
              await _audioPlayer.setUrl(_selectedVerse!.audio);
              _audioPlayer.play();
            }
          },
        ),
        IconButton(
          icon: Icon(
            _recordState == RecordState.stop
                ? Icons.mic
                : Icons.mic_none_outlined,
          ),
          onPressed: () async {
            if (_recordState == RecordState.stop) {
              await _startRecording();
            } else {
              await _stopRecording();
              setState(() {});
              if (_selectedVerse != null) {
                if (await Permission.storage.request().isGranted) {
                  ref.read(submitAudioControllerProvider.notifier).submitAudio(
                        verseText: _selectedVerse!.text,
                        audioPath: audioPath!,
                        onSuccess: () {
                          setState(() {
                            _selectedVerse = null;
                          });
                        },
                      );
                }
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.pause),
          onPressed: () {
            _audioPlayer.pause();
          },
        ),
      ],
    );
  }

  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        Directory appDocDir = await getApplicationDocumentsDirectory();
        audioPath = '${appDocDir.path}/file_to_upload.m4a';

        await _audioRecorder.start(
          path: audioPath,
          encoder: AudioEncoder.aacLc,
          bitRate: 128000,
          samplingRate: 44100,
        );
        setState(() => _recordState = RecordState.record);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _stopRecording() async {
    audioPath = await _audioRecorder.stop();
    setState(() => _recordState = RecordState.stop);
  }
}
