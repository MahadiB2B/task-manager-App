import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(
       isProfileScreenOpen: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(

            children: [
              const SizedBox (height:48),
          Text('Update Profile',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w500),),
              const SizedBox(height:32,),
              _buildPhotoPicker(),
              const SizedBox(height:16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'First name'
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Last name'
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Phone'
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
              const SizedBox(height: 16,),
             ElevatedButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined)),
            const SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildPhotoPicker() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 100,
            decoration: BoxDecoration(color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            )),
            alignment: Alignment.center,
            child: Text('Photo',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
            ),),
          ),
          const SizedBox(width: 8,),
          Text("Selected Photo"),
        ],
      ),
    );
  }
}
