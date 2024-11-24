import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

import '../../data/models/network_response.dart';
import '../../data/servics/network_caller.dart';
import '../../data/utils/utils.dart';
import '../utilis/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final TextEditingController _emailTEController =TextEditingController();
final TextEditingController _firstNameTEController = TextEditingController();
final TextEditingController _lastNameTEController = TextEditingController();
final TextEditingController _mobileTEController = TextEditingController();
final TextEditingController _passwordTEController = TextEditingController();
bool _inProgress = false;
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
                  style: const TextStyle(
                      color:Colors.black,
                      fontWeight:FontWeight.w600,
                      fontSize: 16,
                      letterSpacing:0.5),
                  text:"Have account?",
                  children:[TextSpan(text: 'Sign In',
                    style:const TextStyle(
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
                 controller: _emailTEController,
                 keyboardType: TextInputType.emailAddress,
                decoration:const InputDecoration(
                    hintText: 'Email'),
                 validator: (String? value){
                   if(value?.isEmpty ?? true){
                     return 'Enter valid email';
                   }
                   return null;
                 },
                 autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: _firstNameTEController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: 'First Name'),
                validator:(String? value){
                  if (value?.isEmpty ?? true){
                    return 'Enter First Name';
                  }
                  return null;
                } ,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
               const SizedBox(height: 8,),
               TextFormField(
                 controller: _lastNameTEController,
                 keyboardType: TextInputType.name,
                 decoration: const InputDecoration(
                     hintText: 'Last Name'),
                 validator: (String? value){
                   if (value?.isEmpty ?? true){
                     return 'Enter Last Name';}
                   return null;
                 },
                 autovalidateMode: AutovalidateMode.onUserInteraction,
               ),
               const SizedBox(height: 8,),
               TextFormField(
                 controller: _mobileTEController,
                 keyboardType: TextInputType.phone,
                 decoration: const InputDecoration(
                     hintText: 'Mobile'),
                 validator: (String? value){
                   if (value?.isEmpty ?? true){return 'Enter  Mobile Number';}
                   return null;
                 },
                 autovalidateMode: AutovalidateMode.onUserInteraction,
               ),
               const SizedBox(height: 8,),
               TextFormField(
                 controller: _passwordTEController,
                 decoration: const InputDecoration(
                     hintText: 'Password'),
                 validator: (String? value){
                   if (value?.isEmpty ??true){return 'Enter Your Password';}
                   return null;
                 },
                 autovalidateMode: AutovalidateMode.onUserInteraction,
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
 );
  }
  void _onTapNextButton(){
    if (_formkey.currentState!.validate()==false){
      _signUp();

    }

  }
Future<void> _signUp()async{
    _inProgress=true;
    setState(() {});
    Map<String,dynamic> requestBody ={
      "email":_emailTEController.text.trim(),
      "firstName":_firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password":_passwordTEController.text,
      "photo":"",
    };
    NetworkResponse response =await NetworkCaller.postRequest(
      url: Urls.registration,
    body:requestBody,);
    _inProgress = false;
    setState(() {});
    if (response.isSuccess){
      _clearTextFields();
     showSnackBarMessage(
         context ,'New user created'
     );
    }else{
      showSnackBarMessage(
          context, response.errorMessage,true
      );
    }
}
void _clearTextFields(){
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
}
  void _onTapSignIn(){
    Navigator.pop(context);
  }
@override
  void dispose(){
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();

    super.dispose();
}
}
