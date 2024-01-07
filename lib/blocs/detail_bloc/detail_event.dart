import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailById extends DetailEvent {
  final String id;

  const FetchDetailById({required this.id});

  @override
  List<Object> get props => [id];
}
