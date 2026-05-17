import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../services/api_service.dart';

class BookProvider with ChangeNotifier {
  final ApiService apiService = ApiService();

  List<Book> _books = [];
  bool isLoading = false;
  String error = '';

  List<Book> get books => _books;

  Future<void> fetchBooks() async {
    try {
      isLoading = true;
      notifyListeners();
      _books = await apiService.fetchBooks();
      error = '';
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addBook(Book book) async {
    await apiService.addBook(book);
    _books.add(book);
    notifyListeners();
  }

  Future<void> updateBook(Book updatedBook) async {
    await apiService.updateBook(updatedBook);
    final index = _books.indexWhere((b) => b.id == updatedBook.id);
    if (index != -1) {
      _books[index] = updatedBook;
      notifyListeners();
    }
  }

  Future<void> deleteBook(int id) async {
    await apiService.deleteBook(id);
    _books.removeWhere((b) => b.id == id);
    notifyListeners();
  }

  // Update note field locally — no API call need
  void updateNote(int id, String note) {
    final index = _books.indexWhere((b) => b.id == id);
    if (index != -1) {
      _books[index] = _books[index].copyWith(note: note);
      notifyListeners();
    }
  }
}
