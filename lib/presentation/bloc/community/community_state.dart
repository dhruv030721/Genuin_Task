
import 'package:equatable/equatable.dart';
import 'package:genuin_task/data/models/community_data/community_data.dart';

abstract class CommunityState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommunityInitial extends CommunityState {}

class CommunityLoading extends CommunityState {}

class CommunityLoaded extends CommunityState {
  final CommunityData communityData;

  CommunityLoaded(this.communityData);

  @override
  List<Object> get props => [communityData];
}

class CommunityError extends CommunityState {
  final String message;

  CommunityError(this.message);

  @override
  List<Object> get props => [message];
}
