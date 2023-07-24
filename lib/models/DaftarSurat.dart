// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class DaftarSurat extends Equatable {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final String audio;
  const DaftarSurat({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  DaftarSurat copyWith({
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
    String? audio,
  }) {
    return DaftarSurat(
      nomor: nomor ?? this.nomor,
      nama: nama ?? this.nama,
      namaLatin: namaLatin ?? this.namaLatin,
      jumlahAyat: jumlahAyat ?? this.jumlahAyat,
      tempatTurun: tempatTurun ?? this.tempatTurun,
      arti: arti ?? this.arti,
      deskripsi: deskripsi ?? this.deskripsi,
      audio: audio ?? this.audio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nomor': nomor,
      'nama': nama,
      'nama_latin': namaLatin,
      'jumlah_ayat': jumlahAyat,
      'tempat_turun': tempatTurun,
      'arti': arti,
      'deskripsi': deskripsi,
      'audio': audio,
    };
  }

  factory DaftarSurat.fromMap(Map<String, dynamic> map) {
    return DaftarSurat(
      nomor: map['nomor'] as int,
      nama: map['nama'] as String,
      namaLatin: map['nama_latin'] as String,
      jumlahAyat: map['jumlah_ayat'] as int,
      tempatTurun: map['tempat_turun'] as String,
      arti: map['arti'] as String,
      deskripsi: map['deskripsi'] as String,
      audio: map['audio'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DaftarSurat.fromJson(String source) =>
      DaftarSurat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      nomor,
      nama,
      namaLatin,
      jumlahAyat,
      tempatTurun,
      arti,
      deskripsi,
      audio,
    ];
  }
}
