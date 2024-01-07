import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mininblog/blocs/detail_bloc/detail_bloc.dart';
import 'package:mininblog/blocs/detail_bloc/detail_event.dart';
import 'package:mininblog/models/blog.dart';
import 'package:mininblog/screens/blog_detail.dart';

class BlogItem extends StatelessWidget {
  final Blog blog;
  const BlogItem({required this.blog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<DetailBloc>().add(FetchDetailById(id: blog.id!));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetail(id: blog.id!),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 4 / 2, child: Image.network(blog.thumbnail)),
            ListTile(
              title: Text(blog.title),
              subtitle: Text(blog.author),
            )
          ],
        ),
      ),
    );
  }
}
