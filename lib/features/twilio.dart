// lib/features/twilio.dart
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:twilio_voice/twilio_voice.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void sendTextMessage(String toNumber, String messageBody) async {
  TwilioFlutter twilioFlutter = TwilioFlutter(
    accountSid: 'AC157612dd88c9b68918559b02556cf275',
    authToken: '22dd8a35a84209968156e8e34ff7128f',
    twilioNumber: '+13239634972'
  );

  await twilioFlutter.sendSMS(
    toNumber: toNumber,
    messageBody: messageBody,
  );
}


Future<void> makeCall(String toNumber) async {
  var url = Uri.parse('http://localhost:5000/make_call');
  try {
    var response = await http.post(
      url,
      body: {'to_number': toNumber},
    );
    if (response.statusCode == 200) {
      print('Call initiated: ${response.body}');
    } else {
      print('Failed to make call: ${response.statusCode}, ${response.body}');
    }
  } catch (e) {
    print('Error making call: $e');
  }
}



