import 'package:fasih_ai/src/features/recitation/domain/verse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class VerseListItem extends StatelessWidget {
  final Verse verse;
  final AudioPlayer audioPlayer;
  final VoidCallback onTap;
  final bool isSelected;

  const VerseListItem({
    Key? key,
    required this.verse,
    required this.audioPlayer,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isSelected ? Colors.grey.shade300 : null,
      onTap: onTap,
      title: Text(
        verse.text,
        textAlign: TextAlign.center,
        style: GoogleFonts.amiri(
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
