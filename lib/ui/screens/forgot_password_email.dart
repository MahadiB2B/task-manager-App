import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utilis/app_colors.dart';

class ForgotPasswordEmailAddress extends StatefulWidget {
  const ForgotPasswordEmailAddress({super.key});

  @override
  State<ForgotPasswordEmailAddress> createState() => _ForgotPasswordEmailAddressState();
}

class _ForgotPasswordEmailAddressState extends State<ForgotPasswordEmailAddress> {

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(

      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 82,),
              Text("Your Email Address",
                style: textTheme.displaySmall?.copyWith
                  (fontWeight: FontWeight.w500),),
              Text("A 6 digits verification otp will be sent to your email address",
                style: textTheme.titleSmall?.copyWith
                  (color: Colors.grey),),
              const SizedBox(height: 24,),
              _buildVerifyEmailForm(),
              const SizedBox(height:48),
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
  Widget _buildVerifyEmailForm() {
    return Column(
             children:[
               TextFormField(
                 keyboardType: TextInputType.emailAddress,
                decoration:const InputDecoration(
                    hintText: 'Email'
                ),
              ),
              const SizedBox(height: 8,),

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
