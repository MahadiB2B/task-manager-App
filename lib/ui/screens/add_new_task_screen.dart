import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: TMAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 42,),
              Text("Add New Task",style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  hintText:"Title",
                  label: Text("Title"),
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText:"Description",
                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
