import 'package:fasih_ai/src/features/recitation/domain/verse.dart';

/// Test products to be used until a data source is implemented
const kTestVerses = [
  // Verse(id: id, surah: surah, ayah: ayah, text: text, translation: translation, audio: audio)
  Verse(
    id: '1',
    surah: 1,
    ayah: 1,
    text: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
    translation:
        'In the name of Allah, the Entirely Merciful, the Especially Merciful.',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3',
  ),
  Verse(
    id: '2',
    surah: 1,
    ayah: 2,
    text: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    translation: 'Praise be to Allah, Lord of the worlds -',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/2.mp3',
  ),
  Verse(
    id: '3',
    surah: 1,
    ayah: 3,
    text: 'الرَّحْمَٰنِ الرَّحِيمِ',
    translation: 'The Entirely Merciful, the Especially Merciful,',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/3.mp3',
  ),
  Verse(
    id: '4',
    surah: 1,
    ayah: 4,
    text: 'مَالِكِ يَوْمِ الدِّينِ',
    translation: 'Sovereign of the Day of Recompense.',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/4.mp3',
  ),
  Verse(
    id: '5',
    surah: 1,
    ayah: 5,
    text: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    translation: 'It is You we worship and You we ask for help.',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/5.mp3',
  ),
  Verse(
    id: '6',
    surah: 1,
    ayah: 6,
    text: 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    translation: 'Guide us to the straight path -',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/6.mp3',
  ),
  Verse(
    id: '7',
    surah: 1,
    ayah: 7,
    text:
        'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
    translation:
        'The path of those upon whom You have bestowed favor, not of those who have evoked [Your] anger or of those who are astray.',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/7.mp3',
  ),
  Verse(
    id: '8',
    surah: 2,
    ayah: 1,
    text: 'الم',
    translation: 'Alif, Lam, Meem.',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/8.mp3',
  ),
  Verse(
    id: '9',
    surah: 2,
    ayah: 2,
    text: 'ذَٰلِكَ الْكِتَابُ لَا رَيْبَ ۛ فِيهِ ۛ هُدًى لِلْمُتَّقِينَ',
    translation:
        'This is the Book about which there is no doubt, a guidance for those conscious of Allah -',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/9.mp3',
  ),
  Verse(
    id: '10',
    surah: 2,
    ayah: 3,
    text:
        'الَّذِينَ يُؤْمِنُونَ بِالْغَيْبِ وَيُقِيمُونَ الصَّلَاةَ وَمِمَّا رَزَقْنَاهُمْ يُنْفِقُونَ',
    translation:
        'Who believe in the unseen, establish prayer, and spend out of what We have provided for them,',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/10.mp3',
  ),
  Verse(
    id: '11',
    surah: 2,
    ayah: 4,
    text:
        'وَالَّذِينَ يُؤْمِنُونَ بِمَا أُنْزِلَ إِلَيْكَ وَمَا أُنْزِلَ مِنْ قَبْلِكَ وَبِالْآخِرَةِ هُمْ يُوقِنُونَ',
    translation:
        'And who believe in what has been revealed to you, [O Muhammad], and what was revealed before you, and of the Hereafter they are certain [in faith].',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/11.mp3',
  ),

  Verse(
    id: '12',
    surah: 2,
    ayah: 5,
    text:
        'أُولَٰئِكَ عَلَىٰ هُدًى مِنْ رَبِّهِمْ ۖ وَأُولَٰئِكَ هُمُ الْمُفْلِحُونَ',
    translation:
        'Those are upon [right] guidance from their Lord, and it is those who are the successful.',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/12.mp3',
  ),
  Verse(
    id: '13',
    surah: 2,
    ayah: 6,
    text:
        'إِنَّ الَّذِينَ كَفَرُوا سَوَاءٌ عَلَيْهِمْ أَأَنْذَرْتَهُمْ أَمْ لَمْ تُنْذِرْهُمْ لَا يُؤْمِنُونَ',
    translation:
        'Indeed, those who disbelieve - it is all the same for them whether you warn them or do not warn them - they will not believe.',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/13.mp3',
  ),
  Verse(
    id: '14',
    surah: 2,
    ayah: 7,
    text:
        'خَتَمَ اللَّهُ عَلَىٰ قُلُوبِهِمْ وَعَلَىٰ سَمْعِهِمْ ۖ وَعَلَىٰ أَبْصَارِهِمْ غِشَاوَةٌ ۖ وَلَهُمْ عَذَابٌ عَظِيمٌ',
    translation:
        'Allah has set a seal upon their hearts and upon their hearing, and over their vision is a veil. And for them is a great punishment.',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/14.mp3',
  ),
  Verse(
    id: '15',
    surah: 2,
    ayah: 8,
    text:
        'وَمِنَ النَّاسِ مَنْ يَقُولُ آمَنَّا بِاللَّهِ وَبِالْيَوْمِ الْآخِرِ وَمَا هُمْ بِمُؤْمِنِينَ',
    translation:
        'And of the people are some who say, "We believe in Allah and the Last Day," but they are not believers.',
    audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/15.mp3',
  ),
];
