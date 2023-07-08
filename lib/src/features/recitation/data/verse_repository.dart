import 'dart:async';

import 'package:fasih_ai/src/constants/test_verses.dart';
import 'package:fasih_ai/src/features/recitation/domain/verse.dart';
import 'package:fasih_ai/src/utils/delay.dart';
import 'package:fasih_ai/src/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verse_repository.g.dart';

class FakeVersesRepository {
  FakeVersesRepository({this.addDelay = true});
  final bool addDelay;

  /// Preload with the default list of verses when the app starts
  final _verses = InMemoryStore<List<Verse>>(List.from(kTestVerses));

  List<Verse> getVersesList() {
    return _verses.value;
  }

  Verse? getVerse(String id) {
    return _getVerse(_verses.value, id);
  }

  Future<List<Verse>> fetchVersesList() async {
    return Future.value(_verses.value);
  }

  Stream<List<Verse>> watchVersesList() {
    return _verses.stream;
  }

  Stream<Verse?> watchVerse(String id) {
    return watchVersesList().map((verses) => _getVerse(verses, id));
  }

  /// Update verse or add a new one
  Future<void> setVerse(Verse verse) async {
    await delay(addDelay);
    final verses = _verses.value;
    final index = verses.indexWhere((p) => p.id == verse.id);
    if (index == -1) {
      // if not found, add as a new verse
      verses.add(verse);
    } else {
      // else, overwrite previous verse
      verses[index] = verse;
    }
    _verses.value = verses;
  }

  /// Search for verses where the title contains the search query
  // Future<List<Verse>> searchVerses(String query) async {
  //   assert(
  //     _verses.value.length <= 100,
  //     'Client-side search should only be performed if the number of verses is small. '
  //     'Consider doing server-side search for larger datasets.',
  //   );
  //   // Get all verses
  //   final versesList = await fetchVersesList();
  //   // Match all verses where the title contains the query
  //   return versesList
  //       .where((verse) =>
  //           verse.title.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  // }

  static Verse? _getVerse(List<Verse> verses, String id) {
    try {
      return verses.firstWhere((verse) => verse.id == id);
    } catch (e) {
      return null;
    }
  }
}

@riverpod
FakeVersesRepository versesRepository(VersesRepositoryRef ref) {
  // * Set addDelay to false for faster loading
  return FakeVersesRepository(addDelay: false);
}

@riverpod
Stream<List<Verse>> versesListStream(VersesListStreamRef ref) {
  final versesRepository = ref.watch(versesRepositoryProvider);
  return versesRepository.watchVersesList();
}

@riverpod
Future<List<Verse>> versesListFuture(VersesListFutureRef ref) {
  final versesRepository = ref.watch(versesRepositoryProvider);
  return versesRepository.fetchVersesList();
}

@riverpod
Stream<Verse?> verse(VerseRef ref, VerseID id) {
  final versesRepository = ref.watch(versesRepositoryProvider);
  return versesRepository.watchVerse(id);
}

// @riverpod
// Future<List<Verse>> versesListSearch(
//     VersesListSearchRef ref, String query) async {
//   final link = ref.keepAlive();
//   // * keep previous search results in memory for 60 seconds
//   final timer = Timer(const Duration(seconds: 60), () {
//     link.close();
//   });
//   ref.onDispose(() => timer.cancel());
//   final versesRepository = ref.watch(versesRepositoryProvider);
//   return versesRepository.searchVerses(query);
// }
