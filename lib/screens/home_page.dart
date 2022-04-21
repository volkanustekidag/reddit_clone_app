import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone_app/bloc/reddit_bloc.dart';
import 'package:reddit_clone_app/models/reddit_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<RedditBloc>(context).add(RedditOnRequestEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff6314),
        title: Text("RedditClone"),
      ),
      body: Container(
        color: Colors.black12,
        child: BlocBuilder<RedditBloc, RedditState>(
          builder: (context, state) {
            if (state is RedditLoading) {
              return Center(
                  child: CircularProgressIndicator(
                color: Color(0xffff6314),
              ));
            }

            if (state is RedditSucces) {
              RedditPost redditPost = state.redditPost;

              return RefreshIndicator(
                color: Color(0xffff6314),
                onRefresh: () async {
                  BlocProvider.of<RedditBloc>(context)
                      .add(RedditOnRefreshEvent());
                  return;
                },
                child: Container(
                  child: ListView.builder(
                    itemCount: redditPost.data.children.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Text(
                              redditPost.data.children[index].data2.title,
                            ),
                            subtitle: redditPost
                                        .data.children[index].data2.thumbnail ==
                                    "self"
                                ? null
                                : Image.network(redditPost
                                    .data.children[index].data2.thumbnail)),
                      );
                    },
                  ),
                ),
              );
            }

            if (state is RedditFailuer) {
              return Center(
                child: Text("Have an error!"),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
