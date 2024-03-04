import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/data/user_data.dart';

class FetchUsers {
  static Future<List<UserData>> fetchUsers() async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  QuerySnapshot querySnapshot = await users.get();

  List<UserData> userList = querySnapshot.docs.map((doc) {
    return UserData(user: doc['username']);
  }).toList();

  return userList;
}
}