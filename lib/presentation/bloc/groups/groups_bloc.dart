import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genuin_task/data/models/group_data/group_data.dart';
import 'package:genuin_task/data/repositories/community_repository.dart';
import 'package:genuin_task/data/repositories/community_repository.dart';
import 'package:genuin_task/presentation/bloc/groups/groups_event.dart';
import 'package:genuin_task/presentation/bloc/groups/groups_bloc.dart';
import 'package:genuin_task/presentation/bloc/groups/groups_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  final CommunityRepository communityRepository;

  GroupBloc({required this.communityRepository}) : super(GroupInitial()) {
    on<FetchGroups>(_onFetchGroups);
  }

  Future<void> _onFetchGroups(FetchGroups event, Emitter<GroupState> emit) async {
    emit(GroupLoading());
    try {
      final groups = await communityRepository.fetchCommunityGroups(event.communityId);
      emit(GroupLoaded(groups));
    } catch (e) {
      emit(GroupError("Failed to load groups"));
    }
  }
}
