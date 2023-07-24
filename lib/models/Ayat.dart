class Ayat {
  final int id;
  final int surah;
  final int nomor;
  final String arabic;
  final String transliteration;
  final String translation;

  Ayat({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.arabic,
    required this.transliteration,
    required this.translation,
  });

  factory Ayat.fromMap(Map<String, dynamic> map) {
    return Ayat(
      id: map['id'],
      surah: map['surah'],
      nomor: map['nomor'],
      arabic: map['ar'],
      transliteration: map['tr'],
      translation: map['idn'],
    );
  }
}
