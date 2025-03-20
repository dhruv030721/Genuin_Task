import 'package:equatable/equatable.dart';
import 'package:genuin_task/data/models/group_data/group_data.dart';

abstract class GroupEvent extends Equatable {
  const GroupEvent();

  @override
  List<Object?> get props => [];
}

class FetchGroups extends GroupEvent {
  final String communityId;

  FetchGroups(this.communityId);

  @override
  List<Object?> get props => [communityId];
}
