import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/constants/app_colors.dart';
import '../models/book_model.dart';
import '../providers/book_provider.dart';

class BookDetailScreen extends StatefulWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  late final TextEditingController _notesController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // the saved note from the provider
    final saved = context
        .read<BookProvider>()
        .books
        .firstWhere((b) => b.id == widget.book.id, orElse: () => widget.book)
        .note;
    _notesController = TextEditingController(text: saved);
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _done() {
    context.read<BookProvider>().updateNote(
      widget.book.id!,
      _notesController.text,
    );
    setState(() => _isEditing = false);
  }

  @override
  Widget build(BuildContext context) {
    final book = context.watch<BookProvider>().books.firstWhere(
      (b) => b.id == widget.book.id,
      orElse: () => widget.book,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 180,
                height: 240,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.menu_book,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),

            const SizedBox(height: 24),
            Center(
              child: Text(
                book.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                'By ${book.author}',
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),

            const SizedBox(height: 14),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  5,
                  (i) => Icon(
                    Icons.star,
                    size: 30,
                    color: i < book.rating
                        ? AppColors.primary
                        : Colors.grey.shade700,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),
            const Text(
              'Reading Status',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade600, width: 1.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.menu_book_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    book.status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            Divider(color: Colors.grey.shade800),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Notes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      _isEditing ? _done() : setState(() => _isEditing = true),
                  child: Text(
                    _isEditing ? 'Done' : 'Edit',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 100),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _isEditing
                      ? AppColors.primary.withOpacity(0.6)
                      : Colors.grey.shade800,
                  width: 1.5,
                ),
              ),
              child: _isEditing
                  ? TextField(
                      controller: _notesController,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      maxLines: null,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Write your thoughts here...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        book.note.isEmpty
                            ? 'No notes yet. Start your thoughts about the book!'
                            : book.note,
                        style: TextStyle(
                          color: book.note.isEmpty ? Colors.grey : Colors.white,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
