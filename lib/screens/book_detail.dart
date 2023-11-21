import 'package:flutter/material.dart';
import 'package:book_nest_mobile/models/book.dart';

class DetailItemPage extends StatelessWidget {
  final Book item;

  const DetailItemPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Detail Item"), // Gunakan judul buku sebagai judul halaman
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                item.fields.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Text("Author: ${item.fields.author}"),
            const SizedBox(height: 12),
            Text("Price: ${item.fields.price}"),
            const SizedBox(height: 12),
            Text("Amount: ${item.fields.amount}"),
            const SizedBox(height: 12),
            Text("Description: ${item.fields.description}"),
            const Spacer(), // Spacer untuk membuat tombol BACK di bagian bawah
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}
