import 'package:flutter/material.dart';

import '../widgets/task_card.dart';

class CancelledTaskScreen extends StatelessWidget {
  const CancelledTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index){
          return TaskCard();
        },
        separatorBuilder: (context,index){
          return const SizedBox(height: 8,);
        },
        itemCount: 10);
  }
}
