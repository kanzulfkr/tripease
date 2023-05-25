import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool _isIdActive = true;
  bool _isEnActive = false;

  void selectId() {
    setState(() {
      _isEnActive = _isIdActive;
      _isIdActive = !_isIdActive;
    });
  }

  void selectEn() {
    setState(() {
      _isIdActive = _isEnActive;
      _isEnActive = !_isEnActive;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              _isIdActive ? null : selectId();
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.5,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Indonesia',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: _isIdActive
                          ? const Color.fromRGBO(0, 128, 255, 1)
                          : null,
                    ),
                  ),
                  _isIdActive
                      ? const Icon(
                          Icons.check,
                          color: Color.fromRGBO(0, 128, 255, 1),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _isEnActive ? null : selectId();
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.5,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'English',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: _isEnActive
                          ? const Color.fromRGBO(0, 128, 255, 1)
                          : null,
                    ),
                  ),
                  _isEnActive
                      ? const Icon(
                          Icons.check,
                          color: Color.fromRGBO(0, 128, 255, 1),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
