import 'package:flutter/material.dart';
import 'package:latihan_pak_ary_bagian_2/components/custom_app_bar.dart';
import 'package:latihan_pak_ary_bagian_2/pages/latihan_2_1.dart';

class Latihan24 extends StatefulWidget {
  const Latihan24({super.key});

  @override
  State<Latihan24> createState() => _Latihan24State();
}

class _Latihan24State extends State<Latihan24> {
  final List<Map<String, dynamic>> items = [
    {
      'nama': 'Chisaki',
      'hobi': 'Belajar hal baru',
      'foto': 'assets/images/Chisaki_Tapris_Flutter_Complete_Reference.png',
      'isLiked': false
    },
    {
      'nama': 'Fujiwara',
      'hobi': 'Belajar flutter',
      'foto': 'assets/images/Fujiwara_Chika_Dart_Apprentice.png',
      'isLiked': false
    },
    {
      'nama': 'Miku',
      'hobi': 'Belajar c++',
      'foto': 'assets/images/Miku_Nakano_The_Dart_Programming_Language.png',
      'isLiked': false
    },
    {
      'nama': 'Sae Chabashira',
      'hobi': 'Membuat website',
      'foto': 'assets/images/Sae_Chabashira_Flutter_Complete_Reference.png',
      'isLiked': false
    },
  ];

  void handleLikeClick(bool value, int index) {
    setState(() {
      items[index]['isLiked'] = value;
    });
  }

  void showLargeImage(String image, int index) {
    showDialog(
      context: context,
      builder: (builder) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
                label: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Latihan 2.4'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Latihan21())),
              icon: const Icon(Icons.arrow_forward),
              label: const Text(
                'Ke Tugas 2.1 - 2.3',
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Latihan Listview.Builder',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item = items[index];

                    return GestureDetector(
                      onTap: () => showLargeImage(item['foto'], index),
                      child: Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: ListTile(
                          title: Text(item['nama']),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item['foto'],
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ), // Ukuran avatar
                          ),
                          subtitle: Text(
                            item['hobi'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () =>
                                handleLikeClick(!item['isLiked'], index),
                            icon: item['isLiked']
                                ? Icon(
                                    Icons.favorite,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : const Icon(Icons.favorite_border),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
