import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mininblog/blocs/article_bloc/article_bloc.dart';
import 'package:mininblog/blocs/detail_bloc/detail_bloc.dart';
import 'package:mininblog/repositories/article_repository.dart';
import 'package:mininblog/screens/homepage.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ArticleBloc>(
        create: (context) =>
            ArticleBloc(articleRepository: ArticleRepository()),
      ),
      BlocProvider<DetailBloc>(
        create: (context) => DetailBloc(articleRepository: ArticleRepository()),
      )
    ],
    child: MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)),
      title: 'Mini Blog',
      home: const HomePage(),
    ),
  ));
}
