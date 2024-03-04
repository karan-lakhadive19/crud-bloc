part of 'add_bloc.dart';

@immutable
sealed class AddState {}

final class AddInitial extends AddState {}

final class AddSuccess extends AddState {
  final List<UserData> userList;
  final String docId;

  AddSuccess({required this.userList, required this.docId});
}

final class AddFailure extends AddState {
  final String error;

  AddFailure({required this.error});

}

final class DeleteSuccess extends AddState {}

final class UpdateSuccess extends AddState {}