import 'package:equatable/equatable.dart';

abstract class CommunityEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCommunityData extends CommunityEvent {
  final String communityId;

  FetchCommunityData(this.communityId);

  @override
  List<Object> get props => [communityId];
}
