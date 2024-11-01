import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("New"),),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
Navigator.push(
    context,
    MaterialPageRoute(builder:
        (context)=> const AddNewTaskScreen()));
       },
       child: Icon(Icons.add),),
    );
  }
}

