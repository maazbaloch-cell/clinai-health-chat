import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projectify/Setup_page.dart';
import 'package:projectify/Sign_in.dart';
import 'package:projectify/Signup_page.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text('Create An Account', style: TextStyle(color: Colors.black, fontSize: 30 , fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text('Email', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20 ,right: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                  )
              ),
              child: TextFormField(
                cursorColor:Colors.red,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text('Password', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20 , right: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                  )
              ),
              child: TextFormField(
                cursorColor: Colors.red,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: '********',
                  contentPadding: EdgeInsets.only(left: 10 , top: 12),
                  suffixIcon: Icon(Icons.visibility_off),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(' Confirm Password', style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20 , right: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                  )
              ),
              child: TextFormField(
                cursorColor: Colors.red,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: '********',
                  contentPadding: EdgeInsets.only(left: 10 , top: 12),
                  suffixIcon: Icon(Icons.visibility_off),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SetupPage(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                  border: Border.all(color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Setup Your Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: Text.rich(
                TextSpan(
                  text: "Already have an Account? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign in',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                      recognizer:  TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),

    );
  }
}
