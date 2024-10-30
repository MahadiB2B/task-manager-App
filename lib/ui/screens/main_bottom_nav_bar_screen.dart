import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager/ui/screens/completed_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/progress_task_screen.dart';
import 'package:task_manager/ui/utilis/app_colors.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex =0;
  final List<Widget> _screens =const[
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title:  Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 16,),
            const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Mahadi Hasan",
                 style: TextStyle(
                   fontSize: 16,
                     color: Colors.white,
                 fontWeight: FontWeight.w600),
               ),
               Text("1starmahadi@gmail.com",
                 style: TextStyle(
                     fontSize: 12,
                     color: Colors.white),
               )
             ],
            ),
            ),
            IconButton(
              onPressed: (){}, icon:const Icon(Icons.logout)),
          ],
        ),

      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index){
          _selectedIndex =index;
          setState(() {

          });
        },
        destinations:const [
          NavigationDestination(
              icon: Icon(Icons.new_label),
              label: "New"),
          NavigationDestination(
              icon: Icon(Icons.check_box),
              label: "Completed"),
          NavigationDestination(
              icon: Icon(Icons.close),
              label: "Cancelled"),
          NavigationDestination(
              icon: Icon(Icons.access_time_outlined),
              label: "Progress"),
        ],
      ),
    );
  }
}
