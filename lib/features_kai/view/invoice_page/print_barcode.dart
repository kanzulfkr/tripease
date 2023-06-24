import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PrintBarcode extends StatelessWidget {
  const PrintBarcode({
    super.key,
    required this.orderNumber,
  });

  final String orderNumber;

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: orderNumber,
      version: QrVersions.auto,
      size: 224.0,
    );
  }
}
