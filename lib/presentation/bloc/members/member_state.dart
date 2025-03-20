import 'package:equatable/equatable.dart';
import 'package:genuin_task/data/models/member_data/member_data.dart';

abstract class MemberState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MemberInitial extends MemberState {}

class MemberLoading extends MemberState {}

class MemberLoaded extends MemberState {
  final List<MemberData> members;

  MemberLoaded(this.members);

  @override
  List<Object?> get props => [members];
}

class MemberError extends MemberState {
  final String message;

  MemberError(this.message);

  @override
  List<Object?> get props => [message];
}
