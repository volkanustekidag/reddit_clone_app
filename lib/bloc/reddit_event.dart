part of 'reddit_bloc.dart';

abstract class RedditEvent extends Equatable {}

class RedditOnRequestEvent extends RedditEvent {
  RedditOnRequestEvent();
  @override
  List<Object> get props => [];
}

class RedditOnRefreshEvent extends RedditEvent {
  RedditOnRefreshEvent();

  @override
  List<Object> get props => [];
}
