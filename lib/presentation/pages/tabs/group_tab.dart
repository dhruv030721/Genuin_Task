import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genuin_task/data/repositories/community_repository.dart';
import 'package:genuin_task/presentation/bloc/groups/groups_bloc.dart';
import 'package:genuin_task/presentation/bloc/groups/groups_state.dart';
import 'package:genuin_task/presentation/bloc/groups/groups_event.dart';
import 'package:genuin_task/presentation/widgets/group_card.dart';

class GroupTab extends StatelessWidget {
  final String communityId;
  const GroupTab({super.key, required this.communityId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupBloc(
        communityRepository: CommunityRepository(),
      )..add(FetchGroups(communityId)),
      child: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
          if (state is GroupLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GroupLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(3),
              itemCount: state.groups.length,
              itemBuilder: (context, index) {
                return GroupCard(group: state.groups[index]);
              },
            );
          } else if (state is GroupError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return Center(child: Text("No groups available"));
        },
      ),
    );
  }
}
