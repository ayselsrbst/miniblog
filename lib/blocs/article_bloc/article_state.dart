// initial

// ArticlesInitial
// ArticlesLoading
// ArticlesLoaded
// ArticlesError

import 'package:equatable/equatable.dart';
import 'package:mininblog/models/blog.dart';

abstract class ArticleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticlesLoaded extends ArticleState {
  final List<Blog> blogs;

  ArticlesLoaded({required this.blogs});

  @override
  List<Object?> get props => [blogs];
}

class ArticleError extends ArticleState {}
