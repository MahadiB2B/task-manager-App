import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/ui/screens/forgot_password_email_otp_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utilis/app_colors.dart';

class ResetPasswordEmailScreen extends StatefulWidget {
  const ResetPasswordEmailScreen({super.key});

  @override
  State<ResetPasswordEmailScreen> createState() => _ResetPasswordEmailScreenState();
}

class _ResetPasswordEmailScreenState extends State<ResetPasswordEmailScreen> {

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(

      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 82,),
                Text("Set Password",
                  style: textTheme.displaySmall?.copyWith
                    (fontWeight: FontWeight.w500),),
                Text("Minium number of password should be 8 letters",
                  style: textTheme.titleSmall?.copyWith
                    (color: Colors.grey),),
                const SizedBox(height: 24,),
                _buildResetsPasswordForm(),
                const SizedBox(height: 48),
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
    return RichText(text: TextSpan(
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 0.5),
      text: "Have account?",
      children: [TextSpan(text: 'Sign In',
        style: TextStyle(
            color: AppColors.themeColor),
        recognizer: TapGestureRecognizer()
          ..onTap = _onTapSignIn,
      ),
      ],
    ),);
  }

  Widget _buildResetsPasswordForm() {
    return Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: 'Password'
            ),
          ),
          const SizedBox(height: 8,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: 'Confirm Password'
            ),
          ),
          const SizedBox(height: 8,),

          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: _onTapNextButton,
              child: const Icon(Icons.arrow_circle_right_outlined)
          ),
        ]
    );
  }

  void _onTapNextButton() {
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => const SignINScreen()),
          (_) => false,);
}
  void _onTapSignIn(){
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context)=> const SignINScreen()),
          (_) => false,);
  }}