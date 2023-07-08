import 'package:just_audio/just_audio.dart';
import 'package:fasih_ai/src/common_widgets/async_value_widget.dart';
import 'package:fasih_ai/src/common_widgets/empty_placeholder_widget.dart';
import 'package:fasih_ai/src/features/recitation/data/verse_repository.dart';
import 'package:fasih_ai/src/features/recitation/domain/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class VerseListScreen extends StatelessWidget {
  const VerseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          final verseListValue = ref.watch(versesListStreamProvider);
          final audioPlayer = AudioPlayer();

          return AsyncValueWidget<List<Verse>>(
            value: verseListValue,
            data: (verses) => verses.isEmpty
                ? const EmptyPlaceholderWidget(
                    message: 'No verses found',
                  )
                : ListView.builder(
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      final verse = verses[index];
                      return ListTile(
                        title: Text(
                          verse.text,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.amiri(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () async {
                            await audioPlayer.setUrl(verse.audio);
                            audioPlayer.play();
                          },
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
