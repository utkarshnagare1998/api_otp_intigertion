import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class SentOtpController extends GetxController {
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
 sendOTP({required BuildContext context, required String number}) async {
 
    try {
       var payload = {"phoneNumber": number, "groupId": 1703228300417};
    //  String phoneNumber = TextEditingController().text;
    String apiUrl = 'https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com/authgw/sendotp/'; // Replace this with your actual API endpoint

      final response = await http.post(
     
        Uri.parse(apiUrl ),
       headers: {'Content-Type': 'application/json'}, // Add headers to specify JSON content
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('OTP Sent successfully!'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to send OTP. Please try again later.'),
        ));
      }
    } catch (error) {
      print('Error sending OTP: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to send OTP. Please try again later.'),
      ));
    }
  }
}


