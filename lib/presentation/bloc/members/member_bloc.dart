import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genuin_task/data/repositories/community_repository.dart';
import 'member_event.dart';
import 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final CommunityRepository communityRepository;

  MemberBloc(this.communityRepository) : super(MemberInitial()) {
    on<FetchMembers>(_onFetchMembers);
  }

  Future<void> _onFetchMembers(FetchMembers event, Emitter<MemberState> emit) async {
    emit(MemberLoading());

    try {
      final members = await communityRepository.fetchCommunityMembers(event.communityId);
      emit(MemberLoaded(members));
    } catch (e) {
      emit(MemberError(e.toString()));
    }
  }
}
