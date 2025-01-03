import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';

import '../utilis/app_colors.dart';
import '../widgets/task_card.dart';
import '../widgets/task_summary_card.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          _buildSummarySection(),
          Expanded(
              child: ListView.separated(
              itemBuilder: (context,index){
                return TaskCard();
              },
              separatorBuilder: (context,index){
                return const SizedBox(height: 8,);
              },
              itemCount: 10)
          )
        ],
      ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
Navigator.push(
    context,
    MaterialPageRoute(builder:
        (context)=> const AddNewTaskScreen()));
       },
       child: const Icon(Icons.add),),
    );
  }

  Widget _buildSummarySection() {
    return const Padding(
          padding: EdgeInsets.all(8),

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                 TaskSummaryCard(
                   count:9,
                   title:"New",
                 ),
                  TaskSummaryCard(
                    count:9,
                    title:"Completed",
                  ),
                  TaskSummaryCard(
                    count:9,
                    title:"Cancelled",
                  ),
                  TaskSummaryCard(
                    count:9,
                    title:"Progress",
                  ),
                ],
              ),
            ),

        );
  }
}





