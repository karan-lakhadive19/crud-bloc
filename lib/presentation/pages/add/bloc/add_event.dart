part of 'add_bloc.dart';

@immutable
sealed class AddEvent {}

final class AddMember extends AddEvent {
  final String username;

  AddMember({required this.username});
}

final class DeleteMember extends AddEvent {
  final String docId;

  DeleteMember({required this.docId});

}

final class UpdateMember extends AddEvent {
  final String docId;

  UpdateMember({required this.docId});
}
