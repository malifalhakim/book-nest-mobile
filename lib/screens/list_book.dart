import 'package:flutter/material.dart';
import 'package:book_nest_mobile/widgets/left_drawer.dart';
import 'package:book_nest_mobile/model/book.dart';
import 'package:book_nest_mobile/widgets/book_item.dart';

class ListBook extends StatefulWidget {
  const ListBook({super.key});

  @override
  State<ListBook> createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'List Buku',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookItem(book: books[index]);
        },
      ),
    );
  }
}
