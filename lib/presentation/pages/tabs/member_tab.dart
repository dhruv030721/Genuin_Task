import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genuin_task/presentation/bloc/members/member_bloc.dart';
import 'package:genuin_task/presentation/bloc/members/member_event.dart';
import 'package:genuin_task/presentation/bloc/members/member_state.dart';
import 'package:genuin_task/presentation/widgets/member_card.dart';
import 'package:genuin_task/data/repositories/community_repository.dart';

class MemberTab extends StatelessWidget {
  final String communityId;

  const MemberTab({super.key, required this.communityId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberBloc(CommunityRepository())..add(FetchMembers(communityId)),
      child: BlocBuilder<MemberBloc, MemberState>(
        builder: (context, state) {
          if (state is MemberLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MemberLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.members.length,
                itemBuilder: (context, index) {
                  final member = state.members[index];
                  return MemberCard(
                    username: member.nickname,
                    fullName: member.name,
                    bio: member.bio,
                    imageUrl: member.profile_image
                  );
                },
              ),
            );
          } else if (state is MemberError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return Center(child: Text("No members available"));
          }
        },
      ),
    );
  }
}
