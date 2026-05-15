import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../models/book_model.dart';
import 'rating_widget.dart';
import 'status_chip.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),

              child: const Icon(Icons.menu_book, color: Colors.white, size: 40),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(book.author, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  RatingWidget(rating: book.rating),
                  const SizedBox(height: 8),
                  StatusChip(status: book.status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
