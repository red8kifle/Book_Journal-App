class Book {
  final int? id;
  final String title;
  final String author;
  final int rating;
  final String status;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.rating,
    required this.status,
  });
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'] ?? '',
      author: json['body'] ?? 'Unknown Author',
      rating: 4,
      status: 'Reading',
    );
  }//Converts a raw JSON map (e.g. from an API) into a Book object.

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': author,
    };//Converts the Book back to a map, for sending to an API.
  }
}