import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFeedData extends FeedEvent {
  final String deviceId;

  FetchFeedData(this.deviceId);

  @override
  List<Object> get props => [deviceId];
}
