class Book {
  final int? id;
  final String title;
  final String author;
  final int rating;
  final String status;
  final String note;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.rating,
    required this.status,
    this.note = '',
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'] ?? '',
      author: json['body'] ?? 'Unknown Author',
      rating: 4,
      status: 'Reading',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': author,
    };
  }

  Book copyWith({String? note}) {
    return Book(
      id: id,
      title: title,
      author: author,
      rating: rating,
      status: status,
      note: note ?? this.note,
    );
  }
}