import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mininblog/blocs/article_bloc/article_bloc.dart';
import 'package:mininblog/blocs/article_bloc/article_event.dart';
import 'package:mininblog/blocs/article_bloc/article_state.dart';
import 'package:mininblog/screens/add_blog.dart';
import 'package:mininblog/widget/blog_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloglar"),
        actions: [
          IconButton(
            onPressed: () async {
              bool result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddBlog()));

              if (result == true) {
                context.read<ArticleBloc>().add(FetchArticles());
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
        if (state is ArticleInitial) {
          context.read<ArticleBloc>().add(FetchArticles());
          return const Center(
            child: Text("İstek Atılıyor..."),
          );
        }
        if (state is ArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ArticlesLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ArticleBloc>().add(FetchArticles());
            },
            child: ListView.builder(
                itemCount: state.blogs.length,
                itemBuilder: (context, index) =>
                    BlogItem(blog: state.blogs[index])),
          );
        }
        if (state is ArticleError) {
          return const Center(
            child: Text("Hata"),
          );
        }

        return const Center(
          child: Text("Unknown State"),
        );
      }),
    );
  }
}
