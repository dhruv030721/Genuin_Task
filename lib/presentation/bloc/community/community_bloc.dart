import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genuin_task/data/repositories/community_repository.dart';
import 'package:genuin_task/data/models/community_data/community_data.dart';
import 'community_event.dart';
import 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final CommunityRepository communityRepository;

  CommunityBloc(this.communityRepository) : super(CommunityInitial()) {
    on<FetchCommunityData>(_onFetchCommunityData);
  }

  Future<void> _onFetchCommunityData(
    FetchCommunityData event, Emitter<CommunityState> emit) async {
      try {
      emit(CommunityLoading());

      CommunityData communityData = await communityRepository.fetchCommunityData(event.communityId);

      emit(CommunityLoaded(communityData));
  } catch (e) {
    emit(CommunityError("Failed to fetch community data"));
  }
  }
}
