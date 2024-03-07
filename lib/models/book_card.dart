class BookCard {
  final String title;
  final String author;
  final String coverImagePath;

  BookCard({
    required this.title,
    required this.author,
    required this.coverImagePath,
  });

  factory BookCard.fromJson(Map<String, dynamic> json) {
    return BookCard(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      coverImagePath: json['coverImagePath'] ?? '',
    );
  }
}
