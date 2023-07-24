import 'package:e_quran_simple_flutter/models/DetailSurat.dart';
import 'package:e_quran_simple_flutter/providers/DaftarSuratProvider.dart';
import 'package:e_quran_simple_flutter/views/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailSuratPage extends StatelessWidget {
  final int nomor;

  const DetailSuratPage({required this.nomor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DaftarSuratProvider daftarSuratProvider =
        Provider.of<DaftarSuratProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<DetailSurat?>(
          future: daftarSuratProvider.getDetailSurat(nomor),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final detailSurat = snapshot.data!;
              return Text('${detailSurat.nama} (${detailSurat.namaLatin})');
            } else {
              return const Text("Detail Surat");
            }
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
              (route) => false,
            );
          },
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<DetailSurat?>(
        future: daftarSuratProvider.getDetailSurat(nomor),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            final detailSurat = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          detailSurat.tempatTurun
                                  .substring(0, 1)
                                  .toUpperCase() +
                              detailSurat.tempatTurun.substring(1),
                          style: const TextStyle(fontSize: 18),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${detailSurat.namaLatin} (${detailSurat.arti})',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${detailSurat.jumlahAyat} Ayat",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: detailSurat.ayat.length,
                      itemBuilder: (context, index) {
                        final ayat = detailSurat.ayat[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${ayat.nomor}. ${ayat.arabic}",
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ayat.translation,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                detailSurat.suratSebelumnya == false
                                    ? Colors.blueGrey
                                    : Colors.green,
                          ),
                          onPressed: detailSurat.suratSebelumnya == false
                              ? null
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailSuratPage(
                                        nomor: detailSurat
                                            .suratSebelumnya["nomor"],
                                      ),
                                    ),
                                  );
                                },
                          child: const Text("Surat Sebelumnya"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                detailSurat.suratSelanjutnya == false
                                    ? Colors.blueGrey
                                    : Colors.green,
                          ),
                          onPressed: detailSurat.suratSelanjutnya == false
                              ? null
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailSuratPage(
                                        nomor: detailSurat
                                            .suratSelanjutnya["nomor"],
                                      ),
                                    ),
                                  );
                                },
                          child: const Text("Surat Selanjutnya"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text("No data found");
          }
        },
      ),
    );
  }
}
