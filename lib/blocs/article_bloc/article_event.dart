import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchArticles extends ArticleEvent {}

class PostArticle extends ArticleEvent {
  final String title;
  final String content;
  final String thumbnail;
  final String author;

  PostArticle(
      {required this.title,
      required this.content,
      required this.thumbnail,
      required this.author});

  @override
  List<Object?> get props => [title, content, thumbnail, author];
}

class DeleteArticleById extends ArticleEvent {
  final String id;

  DeleteArticleById({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
