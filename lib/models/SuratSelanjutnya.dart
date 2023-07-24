class SuratSelanjutnya {
  final int id;
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final String audio;

  SuratSelanjutnya({
    required this.id,
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  factory SuratSelanjutnya.fromMap(Map<String, dynamic> map) {
    return SuratSelanjutnya(
      id: map['id'],
      nomor: map['nomor'],
      nama: map['nama'],
      namaLatin: map['nama_latin'],
      jumlahAyat: map['jumlah_ayat'],
      tempatTurun: map['tempat_turun'],
      arti: map['arti'],
      deskripsi: map['deskripsi'],
      audio: map['audio'],
    );
  }
}
