import 'package:equatable/equatable.dart';
import 'package:mininblog/models/blog.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final Blog blog;

  const DetailLoaded({required this.blog});

  @override
  List<Object> get props => [blog];
}

class DetailError extends DetailState {}
