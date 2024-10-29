import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utilis/app_colors.dart';
import 'forgot_password_email.dart';

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
                    onPressed: _onTapForgotPasswordButton,
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

  Widget _biuldSignUpSection() {
    return RichText(text:  TextSpan(
                  style: TextStyle(
                      color:Colors.black,
                      fontWeight:FontWeight.w600,
                      fontSize: 16,
                      letterSpacing:0.5),
                  text:"Don't have an account?",
                  children:[TextSpan(text: 'Sign Up',
                    style:TextStyle(
                        color:AppColors.themeColor),
                    recognizer: TapGestureRecognizer()..onTap= _onTapSignUp,
                  ),
                  ],
                ),);
  }
  Widget _buildSignInForm() {
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
                obscureText: true,
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
 Navigator.pushAndRemoveUntil(context,
     MaterialPageRoute(
         builder: (context) =>const MainBottomNavBarScreen()),
         (value) => false);
  }
  void _onTapForgotPasswordButton(){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPasswordEmailAddress()));
  }
  void _onTapSignUp(){
   Navigator.push(context,
       MaterialPageRoute(
         builder: (context) => const SignUpScreen(),
       ),);
  }
}
