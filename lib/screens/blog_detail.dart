import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mininblog/blocs/article_bloc/article_bloc.dart';
import 'package:mininblog/blocs/article_bloc/article_event.dart';
import 'package:mininblog/blocs/detail_bloc/detail_bloc.dart';
import 'package:mininblog/blocs/detail_bloc/detail_event.dart';
import 'package:mininblog/blocs/detail_bloc/detail_state.dart';

class BlogDetail extends StatefulWidget {
  final String id;
  const BlogDetail({required this.id, Key? key}) : super(key: key);

  @override
  BlogDetailState createState() => BlogDetailState();
}

class BlogDetailState extends State<BlogDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      if (state is DetailInitial) {
        context.read<DetailBloc>().add(FetchDetailById(id: widget.id));
        return const Center(
          child: Text("İstek Atılıyor..."),
        );
      }
      if (state is DetailLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is DetailLoaded) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.blog.title),
            actions: [
              IconButton(
                  onPressed: () {
                    context
                        .read<ArticleBloc>()
                        .add(DeleteArticleById(id: widget.id));
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AspectRatio(
                    aspectRatio: 4 / 2,
                    child: Image.network(state.blog.thumbnail)),
                Text(
                  state.blog.author,
                  style: const TextStyle(
                      color: Colors.black45,
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  state.blog.content,
                ),
              ],
            ),
          ),
        );
      }
      if (state is DetailError) {
        return const Center(
          child: Text("Hata"),
        );
      }

      return const Center(
        child: Text("Unknown State"),
      );
    });
  }
}
