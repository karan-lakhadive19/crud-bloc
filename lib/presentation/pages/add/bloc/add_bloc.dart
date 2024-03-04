import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/data/user_data.dart';
import 'package:crud/repos/fetch_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddInitial()) {
    on<AddMember>(_addUser);
    on<DeleteMember>(_deleteMember);
    on<UpdateMember>(_updateMember);
  }

  FutureOr<void> _addUser(AddMember event, Emitter<AddState> emit) async {
  try {
    CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    DocumentReference docRef = await users.add({'username': event.username});
    String docId = docRef.id;
    print('Document ID: $docId');

    List<UserData> userList = await FetchUsers.fetchUsers();
    print("Number of users: ${userList.length}");
    emit(AddSuccess(userList: userList, docId: docId));
  } catch (error) {
    emit(AddFailure(error: error.toString()));
  }
}


  FutureOr<void> _deleteMember(DeleteMember event, Emitter<AddState> emit) {
    return FirebaseFirestore.instance.collection('users')
    .doc(event.docId)
    .delete();
  }

  FutureOr<void> _updateMember(UpdateMember event, Emitter<AddState> emit) {
    return FirebaseFirestore.instance.collection('users').doc(event.docId).update({
      'username' : "fitpage"
    });
  }
}
