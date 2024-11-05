import 'package:flutter/material.dart';

import '../utilis/app_colors.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('title of the task',
              style: Theme.of(context).textTheme.titleSmall,),
            Text('description of task'),
            Text('Date: 08/11/2024'),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTaskStatusChip(),
                Wrap(
                  children: [
                    IconButton(onPressed:_onTapEditButton, icon: Icon(Icons.edit)),
                    IconButton(onPressed: _onTapDeleteButton, icon: Icon(Icons.delete))
                  ],
                ),
              ],
            )
          ],
        ),
      ),);
  }

void _onTapEditButton(){
showDialog(context: context, builder: (context) {
  return AlertDialog(
    title: const Text("Edit Status"),
    content: Column(
     mainAxisSize: MainAxisSize.min,
        children: ['New', 'Completed', 'Cancelled', 'Progress'].map((e) {
          return ListTile(
            onTap: (){},
            title: Text(e),
          );
        }).toList()),
    actions: [
      TextButton(onPressed: () {
        Navigator.pop(context);
      },
          child: Text("Cancel")),
      TextButton(onPressed: () {}, child: Text("Ok")),
    ],
  );
});
}

  void _onTapDeleteButton(){}

  Widget _buildTaskStatusChip() {
    return Chip(
                label: Text("New",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                side: const BorderSide(color:AppColors.themeColor),
              );
  }
}