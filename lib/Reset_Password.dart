import 'package:flutter/material.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Container(
      margin: EdgeInsets.only(left: 20),
      child: Text('Reset Password', style: TextStyle(color: Colors.black, fontSize: 30 , fontWeight: FontWeight.bold),),
    ),
            SizedBox(
              height: 10,
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
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: (){
                },
                child:  Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.blue,
                          )
                      ),
                      child: Center(child: Text('Reset Password', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),)),
                    )
                  ],
                ),
              ),
            ),
    ]
    )
    );
    }
  }
