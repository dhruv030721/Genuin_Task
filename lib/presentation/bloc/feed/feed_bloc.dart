import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genuin_task/presentation/bloc/feed/feed_event.dart';
import 'package:genuin_task/presentation/bloc/feed/feed_state.dart';
import 'package:genuin_task/data/repositories/feed_repository.dart';
import 'package:genuin_task/data/models/feed_data/feed_data.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository feedRepository;

  FeedBloc(this.feedRepository) : super(FeedInitial()) {
    on<FetchFeedData>(_onFetchFeedData);
  }

  Future<void> _onFetchFeedData(FetchFeedData event, Emitter<FeedState> emit) async {
    try {
      emit(FeedLoading());

      List<FeedData> feedList = await feedRepository.fetchFeedData(event.deviceId);
      if (feedList.isNotEmpty) {
        emit(FeedLoaded(feedList));
      } else {
        emit(FeedError("No data available"));
      }
  } catch (e) {
    print(e);
    emit(FeedError("Failed to fetch feed"));
  }
  }
}
