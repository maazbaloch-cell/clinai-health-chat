import 'package:flutter/material.dart';
import 'package:projectify/OTP.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                       'Forget Password',
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ]
               ),




             ),
           ) ,
           SizedBox(
             height: 10,
           ),
           Container(
             margin: EdgeInsets.only(left: 20),
             child: Text('Email', style: TextStyle(color: Colors.black, fontSize: 20),),
           ),
           Padding(
             padding: const EdgeInsets.all(20),
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
             height: 200 ,
           ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: GestureDetector(
               onTap: () {
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(
                     builder: (context) => const Otp(),
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
                     'Verify Email',
                     style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 16, // Responsive size
                     ),
                   ),
                 ),
               ),
             ),
           ),

         ],
      )




    );

  }
}

