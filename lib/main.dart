import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone_app/bloc/reddit_bloc.dart';
import 'package:reddit_clone_app/bloc/reddit_bloc_observer.dart';
import 'package:reddit_clone_app/repositories/reddit_repository.dart';
import 'package:reddit_clone_app/screens/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  final RedditRepository redditRepository =
      RedditRepository(httpClient: http.Client());

  BlocOverrides.runZoned(
      () => runApp(MyApp(
            redditRepository: redditRepository,
          )),
      blocObserver: RedditBlocObserver());
}

class MyApp extends StatelessWidget {
  final RedditRepository redditRepository;
  MyApp({this.redditRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RedditBloc(redditRepository: redditRepository),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage()),
    );
  }
}
