import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../../detail_hotel/model/detail_hotel_model.dart';
import '../model/payment_page_model.dart';

class AnotherPageViewModel extends ChangeNotifier {
  String? paymentMethod;
  late Timer _timer;
  int _secondsRemaining = 300;

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    final minutesString = minutes.toString().padLeft(2, '0');
    final secondsString = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesString:$secondsString';
  }
  
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Keep only digits from the input value
    String cleanedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Apply date format (DD/MM/YY) to the cleaned text
    final buffer = StringBuffer();
    for (var i = 0; i < cleanedText.length; i++) {
      if (i == 2 || i == 4) {
        buffer.write('/');
      }
      if (i >= 6) {
        buffer.write(cleanedText.substring(i));
        break;
      } else {
        buffer.write(cleanedText[i]);
      }
    }

    final formattedText = buffer.toString();
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class CvcCvvInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Keep only digits from the input value
    String cleanedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Apply date format (DD/MM/YY) to the cleaned text
    final buffer = StringBuffer();
    for (var i = 0; i < cleanedText.length; i++) {
      if (i == 3 ) {
        buffer.write('/');
      }
      if (i >= 6) {
        buffer.write(cleanedText.substring(i));
        break;
      } else {
        buffer.write(cleanedText[i]);
      }
    }

    final formattedText = buffer.toString();
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

List<VirtualAccountOption> virtualAccountOptions = [
  VirtualAccountOption(
    title: 'BCA Virtual Account',
    imageAsset: 'assets/images/BCA.jpeg',
    vaNumber: '0000222',
  ),
  VirtualAccountOption(
    title: 'BRI Virtual Account',
    imageAsset: 'assets/images/BRI.jpeg',
    vaNumber: '0000333'
  ),
  VirtualAccountOption(
    title: 'Mandiri Virtual Account',
    imageAsset: 'assets/images/MANDIRI.jpeg',
    vaNumber: '0000444'
  ),
];

List<MinimarketOption> minimarketOptions = [
  MinimarketOption(
    title: 'Indomaret',
    imageAsset: 'assets/images/indomaret.png',
  ),
  MinimarketOption(
    title: 'Alfamart',
    imageAsset: 'assets/images/alfamart.png',
  ),
];