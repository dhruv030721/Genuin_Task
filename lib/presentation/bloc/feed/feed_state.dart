import 'package:genuin_task/data/models/feed_data/feed_data.dart';
import 'package:equatable/equatable.dart';

abstract class FeedState extends Equatable {
  @override
  List<Object> get props => [];
}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List<FeedData> feeds;

  FeedLoaded(this.feeds);

  @override
  List<Object> get props => [feeds];
}

class FeedError extends FeedState {
  final String message;

  FeedError(this.message);

  @override
  List<Object> get props => [message];
}
