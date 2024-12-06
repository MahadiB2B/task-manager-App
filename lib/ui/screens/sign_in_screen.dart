import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/servics/network_caller.dart';
import 'package:task_manager/data/utils/utils.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

import '../utilis/app_colors.dart';
import 'forgot_password_email.dart';

class SignINScreen extends StatefulWidget {
  const SignINScreen({super.key});

  @override
  State<SignINScreen> createState() => _SignINScreenState();
}

class _SignINScreenState extends State<SignINScreen> {
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final TextEditingController _emailTEController = TextEditingController();
final TextEditingController _passwordTEController =TextEditingController();
bool _inProgress =false;
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
    return Form(
      key: _formkey,
      child: Column(
               children:[
                 TextFormField(
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                   controller: _emailTEController,
                   keyboardType: TextInputType.emailAddress,
                  decoration:const InputDecoration(
                      hintText: 'Email'
                  ),
                   validator: (String? value){
                     if (value?.isEmpty ?? true){
                       return 'Enter a valid email';
                     }
                     return null;
                   },
                ),
                const SizedBox(height: 8,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordTEController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Password',
                  ),
                  validator: (String? value){
                    if (value?.isEmpty ?? true){
                      return 'Enter a valid Password';
                    }
                    if (value!.length <4 ){
                      return 'Enter a password more then 4 letters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: _inProgress==false,
                  replacement: const CenteredCircularProgressIndicator(),
                  child: ElevatedButton(
                      onPressed:_onTapNextButton,
                      child: const Icon(Icons.arrow_circle_right_outlined)
                  ),
                ),]
       ),
    );
  }
  void _onTapNextButton() {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _signIn();
  }

  Future<void>_signIn()async{
    _inProgress =true;
    setState(() {
    });
    Map<String,dynamic>requestBody = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
    };
    final NetworkResponse response =await NetworkCaller.postRequest(url: Urls.login,body: requestBody);
    _inProgress = false;
    if (response.isSuccess) {
      await AuthController.saveAccessToken(response.responseData["token"]);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
              builder: (context) =>const MainBottomNavBarScreen()),
              (value) => false,
      );
  }else{
    showSnackBarMessage(context,response.errorMessage,true );
    }}
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
