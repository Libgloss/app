import 'package:flutter/material.dart';
import 'package:libgloss/models/Book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(book.title),
            Text(book.author),
          ],
        ),
      ),
    );
  }
}
