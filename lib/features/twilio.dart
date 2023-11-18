// lib/features/twilio.dart
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:twilio_voice/twilio_voice.dart';

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

Future<void> makePhoneCall(String toNumber) async {
  TwilioVoice twilioVoice = TwilioVoice();

  await twilioVoice.call(
    toNumber: toNumber,
  );
}
