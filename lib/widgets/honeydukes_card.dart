import 'package:flutter/material.dart'; // Impor drawer yang sudah dibuat sebelumnya
import 'package:honeydukes_mobile/screens/honeydukes_form.dart';
import 'package:honeydukes_mobile/screens/menu.dart';
import 'package:honeydukes_mobile/models/honeydukes_models.dart';
import 'package:honeydukes_mobile/screens/honeydukes_itemlist.dart';

class HoneydukesItem {
  final String name;
  final IconData icon;

  HoneydukesItem(this.name, this.icon);
}

class HoneydukesCard extends StatelessWidget {
  final HoneydukesItem item;

  const HoneydukesCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 233, 151, 190),
      child: InkWell(
        // Area responsif terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HoneydukesFormPage(),
                ));
          } else if (item.name == "Lihat Item") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HoneydukesItemListPage(honeydukesList: honeydukesList),
              ),
            );
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
