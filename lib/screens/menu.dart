import 'package:flutter/material.dart';
import 'package:honeydukes_mobile/screens/honeydukes_form.dart';
import 'package:honeydukes_mobile/widgets/left_drawer.dart';
import 'package:honeydukes_mobile/widgets/honeydukes_card.dart';
import 'package:honeydukes_mobile/screens/honeydukes_form.dart';
import 'package:honeydukes_mobile/screens/honeydukes_itemlist.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<HoneydukesItem> items = [
    HoneydukesItem("Lihat Item", Icons.checklist),
    HoneydukesItem("Tambah Item", Icons.add_shopping_cart),
    HoneydukesItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Honeydukes', style: TextStyle(color: Colors.white)),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((HoneydukesItem item) {
                  // Iterasi untuk setiap item
                  return HoneydukesCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
