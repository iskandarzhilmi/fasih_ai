import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class VersesService {
  VersesService(this.ref);
  final Ref ref;

  Future<void> submitAudio({
    required String audioPath,
    required String verseText,
  }) async {
    // Upload the audio file to Firebase Storage
    final time = DateTime.now().millisecondsSinceEpoch;

    final storageRef =
        FirebaseStorage.instance.ref('uploads/audio_files/$time.m4a');

    // For mobile platforms, use File upload
    final uploadTask = storageRef.putFile(File(audioPath));
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();

    log('Uploaded to Firebase Storage: $downloadUrl');

    // Call the backend API to submit the audio
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/v1/predict'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'audioUrl': downloadUrl,
        'quranVerse': verseText,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to submit audio to backend');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);
    print(data['detected_language']);
    print(data['accuracy']);
    print(data['correct_words']);
    print(data['correct_word_count']);

    if (response.statusCode != 200) {
      throw Exception('Failed to submit audio to backend');
    }
  }
}

final versesServiceProvider = Provider((ref) => VersesService(ref));
