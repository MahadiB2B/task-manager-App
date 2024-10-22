import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
          children: [
            const SizedBox(height: 82,),
            Text("Get Started With",
              style: textTheme.displaySmall?.copyWith
                (fontWeight: FontWeight.w500),),
            const SizedBox(height: 24,),
            TextFormField(),
            TextFormField(),
          ],
                ),
        ),),
    );
  }
}
