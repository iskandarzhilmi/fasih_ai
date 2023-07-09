import 'package:fasih_ai/src/features/recitation/application/verses_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
class SubmitAudioController extends StateNotifier<AsyncValue<void>> {
  SubmitAudioController({
    required this.versesService,
  }) : super(const AsyncData(null));

  final VersesService versesService;

  Future<void> submitAudio({
    required String audioPath,
    required String verseText,
    required void Function() onSuccess,
  }) async {
    state = const AsyncLoading();
    try {
      state = const AsyncLoading();
      final newState = await AsyncValue.guard(() async {
        await versesService.submitAudio(
          audioPath: audioPath,
          verseText: verseText,
        );
      });
      if (mounted) {
        // * only set the state if the controller hasn't been disposed
        state = newState;
        if (state.hasError == false) {
          onSuccess();
        }
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final submitAudioControllerProvider =
    StateNotifierProvider.autoDispose<SubmitAudioController, AsyncValue<void>>(
  (ref) => SubmitAudioController(
    versesService: ref.read(versesServiceProvider),
  ),
);
