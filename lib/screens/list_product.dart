import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:honeydukes_mobile/models/product.dart';
import 'package:honeydukes_mobile/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.fields.image),
            Text('${product.fields.name}', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Price: ${product.fields.price}',
                style: TextStyle(fontSize: 15)),
            Text('Amount: ${product.fields.amount}',
                style: TextStyle(fontSize: 15)),
            const SizedBox(height: 10),
            Text('${product.fields.description}',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 20),
            Text('Category: ${product.fields.category}',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Back to List'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct() async {
    var url = Uri.parse('http://localhost:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Product.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<Product>>(
        future: fetchProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              var product = snapshot.data![index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(product.fields.image,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Center(
                    child: Text(product.fields.name),
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        'Amount: ${product.fields.amount}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text('${product.fields.description}',
                          style: TextStyle(fontSize: 12)),
                      SizedBox(height: 20),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
