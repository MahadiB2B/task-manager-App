import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              _buildSignInForm(),
              const SizedBox(height:24),
            Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: _onTapForgotPassword,
                    child: const Text('Forgot Password?',
              style:TextStyle(color: Colors.grey),),
                  ),
                  _biuldSignUpSection()
                ],
              ),
            ),

            ],
                  ),
          ),
        ),),
    );
  }
void _onTapForgotPassword(){
    //Todo: ON tap Forgot password
}
  Widget _biuldSignUpSection() {
    return RichText(text: const TextSpan(
                  style: TextStyle(
                      color:Colors.black,
                      fontWeight:FontWeight.w600,
                      fontSize: 16,
                      letterSpacing:0.5),
                  text:"Don't have an account?",
                  children:[TextSpan(text: 'Sign Up',
                    style:TextStyle(color:AppColors.themeColor),),],
                ),);
  }

  Widget _buildSignInForm() {
    return Column(
             children:[
               TextFormField(
                decoration:const InputDecoration(
                    hintText: 'Email'
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Password'
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed:_onTapNextButton,
                  child: const Icon(Icons.arrow_circle_right_outlined)
              ),]
 );
  }
  void _onTapNextButton(){
    //Todo: on Tap NextButton
  }
}
