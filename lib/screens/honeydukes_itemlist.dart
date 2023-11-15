import 'package:flutter/material.dart';
import 'package:honeydukes_mobile/models/honeydukes_models.dart'; // Import your model
import 'package:honeydukes_mobile/widgets/left_drawer.dart';

class HoneydukesItemListPage extends StatelessWidget {
  final List<Honeydukes> honeydukesList;

  const HoneydukesItemListPage({
    Key? key,
    required this.honeydukesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item Honeydukes'),
        backgroundColor: Color.fromARGB(255, 67, 202, 162),
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: honeydukesList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              title: Text(honeydukesList[index].name),
              subtitle: Text(
                  'Jumlah: ${honeydukesList[index].amount} | Harga: ${honeydukesList[index].price}'),
              onTap: () {
                // Menampilkan popup dengan informasi barang yang di-klik
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(honeydukesList[index].name),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Kategori: ${honeydukesList[index].category}'),
                          Text('Jumlah: ${honeydukesList[index].amount}'),
                          Text('Harga: ${honeydukesList[index].price}'),
                          Text(
                              'Deskripsi: ${honeydukesList[index].description}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
