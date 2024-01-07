import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final String? id;
  final String title;
  final String content;
  final String thumbnail;
  final String author;

  const Blog(
      {this.id,
      required this.title,
      required this.content,
      required this.thumbnail,
      required this.author});

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        thumbnail: json['thumbnail'],
        author: json['author'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['thumbnail'] = thumbnail;
    data['author'] = author;
    return data;
  }

  @override
  List<Object?> get props => [id, title, content, thumbnail, author];
}
