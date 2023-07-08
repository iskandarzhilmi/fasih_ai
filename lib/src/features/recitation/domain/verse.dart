/// * The product identifier is an important concept and can have its own type.
typedef VerseID = String;

class Verse {
  const Verse({
    required this.id,
    required this.surah,
    required this.ayah,
    required this.text,
    required this.translation,
    required this.audio,
  });

  final VerseID id;
  final int surah;
  final int ayah;
  final String text;
  final String translation;
  final String audio;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Verse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          surah == other.surah &&
          ayah == other.ayah &&
          text == other.text &&
          translation == other.translation &&
          audio == other.audio;

  @override
  int get hashCode =>
      id.hashCode ^
      surah.hashCode ^
      ayah.hashCode ^
      text.hashCode ^
      translation.hashCode ^
      audio.hashCode;

  @override
  String toString() {
    return 'Verse{id: $id, surah: $surah, ayah: $ayah, text: $text, translation: $translation, audio: $audio}';
  }
}
