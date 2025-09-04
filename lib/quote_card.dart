import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback onLike;
  final VoidCallback onDelete;
  
  QuoteCard({
    required this.quote,
    required this.onLike,
    required this.onDelete,
    super.key
  });

  Color cardColor(String c) => switch (c.toLowerCase()) {
    'inspiration' => Colors.blueAccent.shade100.withValues(),
    'humor'       => Colors.amber.shade100,
    _             => Colors.purple.shade100,
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor(quote.category),
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Chip(
                label: Text(quote.category),
                backgroundColor: Colors.grey.shade200,
                visualDensity: VisualDensity.compact,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: const Icon(Icons.thumb_up), onPressed: onLike),
                Text('${quote.likes}'),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
