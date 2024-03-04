import 'package:crud/presentation/pages/add/bloc/add_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  final textcontroller = TextEditingController();
  // final AddBloc addbloc = AddBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Column(
        children: [
          TextField(
            controller: textcontroller,
          ),
          ElevatedButton(onPressed: () {
            BlocProvider.of<AddBloc>(context).add(AddMember(username: textcontroller.text.trim()));
          }, child: Text("Add User"))
        ],
      ),
    );
  }
}