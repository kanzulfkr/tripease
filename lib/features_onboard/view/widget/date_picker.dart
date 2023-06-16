import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DatePickerTextField extends StatefulWidget {
  final void Function(DateTime) onDateSelected;

  const DatePickerTextField({super.key, required this.onDateSelected});
  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      onTap: () => _selectDate(context),
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(
          'assets/icons/date_range.svg',
          fit: BoxFit.scaleDown,
        ),
        hintText: 'Masukkan Tanggal Lahir',
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
