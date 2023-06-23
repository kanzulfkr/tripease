import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/payment_page_model.dart';

class AnotherPageViewModel extends ChangeNotifier {
  String? paymentMethod;
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'\D'), '');

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
      if (i == 3) {
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
      howTo: ['B', 'C', 'A']),
  VirtualAccountOption(
      title: 'BRI Virtual Account',
      imageAsset: 'assets/images/BRI.jpeg',
      vaNumber: '0000333',
      howTo: ['B', 'R', 'I']),
  VirtualAccountOption(
      title: 'Mandiri Virtual Account',
      imageAsset: 'assets/images/MANDIRI.jpeg',
      vaNumber: '0000444',
      howTo: ['MAN', 'DI', 'RI']),
];

List<MinimarketOption> minimarketOptions = [
  MinimarketOption(
      title: 'Indomaret',
      imageAsset: 'assets/images/indomaret.png',
      paymentCode: 'ABC123',
      howTo: ['IND', 'OMA', 'RET']),
  MinimarketOption(
      title: 'Alfamart',
      imageAsset: 'assets/images/alfamart.png',
      paymentCode: 'ZXC098',
      howTo: ['AL', 'FA', 'MART']),
];
