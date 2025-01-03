import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/profile_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utilis/app_colors.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,  this.isProfileScreenOpen =false,
  });
final bool isProfileScreenOpen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (isProfileScreenOpen){
          return;
        }
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),);
      },
       child:  AppBar(
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
                  onPressed: ()async{
                    await AuthController.clearUserData();
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(
                            builder: (context)=>const SignINScreen()), (predicate)=>false);
                  }, icon:const Icon(Icons.logout)),
            ],
          ),
        ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}