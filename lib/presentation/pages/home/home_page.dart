import 'package:crud/presentation/pages/add/add_user.dart';
import 'package:crud/presentation/pages/add/bloc/add_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("CRUD Bloc"),
      ),
      body: BlocBuilder<AddBloc, AddState>(
        builder: (context, state) {
          if (state is AddSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.userList[index].user),
                  leading: IconButton(
                    onPressed: () {
                      BlocProvider.of<AddBloc>(context)
                          .add(UpdateMember(docId: state.docId));
                    },
                    icon: Icon(Icons.update),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        BlocProvider.of<AddBloc>(context)
                            .add(DeleteMember(docId: state.docId));
                      },
                      icon: Icon(Icons.delete)),
                );
              },
              itemCount: state.userList.length,
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
