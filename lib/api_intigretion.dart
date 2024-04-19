import 'package:api_intigertion/sent_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ApiIntigertionScreen extends StatefulWidget {
  const ApiIntigertionScreen({super.key});

  @override
  State<ApiIntigertionScreen> createState() => _ApiIntigertionScreenState();
}
 
class _ApiIntigertionScreenState extends State<ApiIntigertionScreen> {
  // TextEditingController phonenumber = TextEditingController();
   final SentOtpController _controllers = Get.put(SentOtpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Api Intigetion",style: TextStyle(fontSize: 20,color: Colors.black),),
SizedBox(height: 30),
          TextField(
      controller: _controllers.phoneController,
      decoration: InputDecoration(
        hintText: 'Enter your text here...',
        labelText: 'Text Field',
        border: OutlineInputBorder(),
      ),
      onChanged: (text) {
        // You can perform any action when the text changes
        print('Text changed: $text');
      },),



      SizedBox(height: 30,),
       ElevatedButton(
        
      onPressed: () {
 _controllers.sendOTP(
            context: context, number: _controllers.phoneController.text);
        // Implement your send button action here
        print('Send button pressed');
      },
      child: Text('Send'),
    ),
        ],
      ),
    );
  }
}