part of 'reddit_bloc.dart';

abstract class RedditState extends Equatable {
  @override
  List<Object> get props => [];
}

class RedditInitial extends RedditState {
  @override
  List<Object> get props => [];
}

class RedditLoading extends RedditState {}

class RedditSucces extends RedditState {
  final RedditPost redditPost;
  RedditSucces({this.redditPost});

  @override
  List<Object> get props => [redditPost];
}

class RedditFailuer extends RedditState {}
