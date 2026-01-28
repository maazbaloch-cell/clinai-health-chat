import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:date_field/date_field.dart';
DateTime? selectedDate;
class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Setup Your Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                // LEFT: First Name
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       RichText(
                        text: TextSpan(
                          text: 'First Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Faizan',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16), // gap between columns

                // RIGHT: Last Name
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       RichText(
                        text: TextSpan(
                          text: 'Last Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Ansari',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),
            Container(
             child: RichText(text: TextSpan(
               text: 'Clinical Experience',
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 14,
               ),
               children: [
                 TextSpan(
                   text: '*',
                   style: TextStyle(
                     color: Colors.red,
                     fontSize: 14,
                   ),
                 )
               ],
             )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
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
                    hintText: 'Enter Years',
                    contentPadding: EdgeInsets.only( left: 10 ,bottom: 15),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              child: RichText(text: TextSpan(
                text: 'Years of Medical License',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  )
                ],
              )),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
            child:  Padding(
              padding: EdgeInsetsGeometry.only(left: 10),
              child: DropDownTextField(
                clearOption: false,
                textFieldDecoration:  InputDecoration(
                  labelText: 'Select Year',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                dropDownItemCount: 6,
                dropDownList: const [
                  DropDownValueModel(name: '0 years', value: 0),
                  DropDownValueModel(name: '1 year', value: 1),
                  DropDownValueModel(name: '2 years', value: 2),
                  DropDownValueModel(name: '3 years', value: 3),
                  DropDownValueModel(name: '4 years', value: 4),
                  DropDownValueModel(name: '5+ years', value: 5),
                ],
                onChanged: (val) {
                  // handle value
                },
              ),
            )
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: RichText(text: TextSpan(
                text: 'Date of Birth',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  )
                ],
              )),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
               child:   Padding(
            padding:  EdgeInsets.only(left: 10),
        child: DateTimeFormField(
          canClear: false,
          decoration:  InputDecoration(
            labelText: 'Enter Date',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          firstDate: DateTime.now().add(const Duration(days: 10)),
          lastDate: DateTime.now().add(const Duration(days: 40)),
          initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
          onChanged: (DateTime? value) {
            selectedDate = value;
          },
        ),
      )
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: RichText(text: TextSpan(
                text: 'Medical Specialty',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  )
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
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
                    hintText: 'Enter Medical Specialty',
                    contentPadding: EdgeInsets.only( left: 10 ,bottom: 15),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
           SizedBox(
             height:50,
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
                      child: Center(child: Text('Setup Your Profile', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
