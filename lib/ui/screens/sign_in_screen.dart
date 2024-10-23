import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utilis/app_colors.dart';

class SignINScreen extends StatefulWidget {
  const SignINScreen({super.key});

  @override
  State<SignINScreen> createState() => _SignINScreenState();
}

class _SignINScreenState extends State<SignINScreen> {

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
            children: [
              const SizedBox(height: 82,),
              Text("Get Started With",
                style: textTheme.displaySmall?.copyWith
                  (fontWeight: FontWeight.w500),),
              const SizedBox(height: 24,),
              TextFormField(
                decoration:InputDecoration(
                hintText: 'Email'
                  ),
                ),
             const SizedBox(height: 8,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
              ),
          
              const SizedBox(height: 16),
          
              ElevatedButton(
                 
                  onPressed: (){},
                  child: Icon(Icons.arrow_circle_right_outlined))
          
            ],
                  ),
          ),
        ),),
    );
  }
}
