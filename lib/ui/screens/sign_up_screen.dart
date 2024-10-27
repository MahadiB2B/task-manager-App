import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utilis/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

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
              Text("Join with us",
                style: textTheme.displaySmall?.copyWith
                  (fontWeight: FontWeight.w500),),
              const SizedBox(height: 24,),
              _buildSignUpForm(),
              const SizedBox(height:24),
            Center(
              child: Column(
                children: [
                  _biuldHaveAnAccount()
                ],
              ),
            ),

            ],
                  ),
          ),
        ),),
    );
  }

  Widget _biuldHaveAnAccount() {
    return RichText(text:  TextSpan(
                  style: TextStyle(
                      color:Colors.black,
                      fontWeight:FontWeight.w600,
                      fontSize: 16,
                      letterSpacing:0.5),
                  text:"Have account?",
                  children:[TextSpan(text: 'Sign In',
                    style:TextStyle(
                        color:AppColors.themeColor),
                    recognizer: TapGestureRecognizer()..onTap= _onTapSignIn,
                  ),
                  ],
                ),);
  }
  Widget _buildSignUpForm() {
    return Column(
             children:[
               TextFormField(
                 keyboardType: TextInputType.emailAddress,
                decoration:const InputDecoration(
                    hintText: 'Email'
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: 'First Name'
                ),
              ),
               const SizedBox(height: 8,),
               TextFormField(
                 keyboardType: TextInputType.name,
                 decoration: const InputDecoration(
                     hintText: 'Last Name'
                 ),
               ),
               const SizedBox(height: 8,),
               TextFormField(
                 keyboardType: TextInputType.phone,
                 decoration: const InputDecoration(
                     hintText: 'Mobile'
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
  void _onTapSignIn(){
    Navigator.pop(context);
  }
}
