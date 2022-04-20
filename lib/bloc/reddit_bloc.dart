import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone_app/models/reddit_post.dart';
import 'package:reddit_clone_app/repositories/reddit_repository.dart';

part 'reddit_event.dart';
part 'reddit_state.dart';

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  final RedditRepository redditRepository;

  RedditBloc({this.redditRepository}) : super(RedditInitial()) {
    on<RedditOnRequestEvent>((event, emit) async {
      emit(RedditLoading());

      try {
        final RedditPost redditPost = await redditRepository.getPosts();
        emit(RedditSucces(redditPost: redditPost));
      } catch (e) {
        emit(RedditFailuer());
      }
    });

    on<RedditOnRefreshEvent>((event, emit) async {
      try {
        final RedditPost redditPost = await redditRepository.getPosts();
        emit(RedditSucces(redditPost: redditPost));
      } catch (e) {
        emit(RedditFailuer());
      }
    });
  }
}
