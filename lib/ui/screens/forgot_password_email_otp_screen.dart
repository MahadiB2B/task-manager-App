import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/resets_password_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utilis/app_colors.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  const ForgotPasswordOtpScreen({super.key});

  @override
  State<ForgotPasswordOtpScreen> createState() => _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {

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
              Text("Pin Verification",
                style: textTheme.displaySmall?.copyWith
                  (fontWeight: FontWeight.w500),),
              Text("A 6 digits verification OTP has been sent to your email address",
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
               PinCodeTextField(
                 keyboardType: TextInputType.number,
                 length: 6,
                 obscureText: false,
                 animationType: AnimationType.fade,
                 pinTheme: PinTheme(
                   shape: PinCodeFieldShape.box,
                   borderRadius: BorderRadius.circular(5),
                   fieldHeight: 50,
                   fieldWidth: 40,
                   activeFillColor: Colors.transparent,
                   inactiveFillColor: Colors.white,
                   selectedFillColor: Colors.white,
                 ),
                 animationDuration: Duration(milliseconds: 300),
                 backgroundColor: Colors.blue.shade50,
                 enableActiveFill: true,
                 appContext: context,
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
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> const ResetPasswordEmailScreen(),),);
  }
  void _onTapSignIn(){
   Navigator.pushAndRemoveUntil(context,
     MaterialPageRoute(builder: (context)=> const SignINScreen()),
     (_) => false,);
  }
}
