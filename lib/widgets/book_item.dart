import 'package:flutter/material.dart';
import 'package:book_nest_mobile/model/book.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({required this.book, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.name),
      subtitle: Text(
          'Price: ${book.price}\nAuthor: ${book.author}\nAmount: ${book.amount}\nDescription: ${book.description}'),
    );
  }
}
