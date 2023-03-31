class Article {
  final String? id;
  final String title;
  final String content;
  final String source;
  final List<String>? tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  Article({
    this.id,
    required this.title,
    required this.content,
    required this.source,
    this.tags,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'source': source,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      source: json['source'],
      tags: List<String>.from(json['tags'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }
}
