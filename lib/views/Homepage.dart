import 'package:e_quran_simple_flutter/models/DaftarSurat.dart';
import 'package:e_quran_simple_flutter/providers/DaftarSuratProvider.dart';
import 'package:e_quran_simple_flutter/views/DetailSuratPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final DaftarSuratProvider daftarSuratProvider =
        Provider.of<DaftarSuratProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Surat")),
      body: FutureBuilder<List<DaftarSurat>?>(
        future: daftarSuratProvider.getDaftarSurat(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching surahs'),
            );
          } else if (snapshot.hasData) {
            final surahs = snapshot.data!;
            return ListView.builder(
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                final surah = surahs[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      surah.nama,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        'Surah ${surah.namaLatin}, ${surah.jumlahAyat} Ayat'),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailSuratPage(nomor: surah.nomor),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.menu_book,
                        size: 30.0,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
