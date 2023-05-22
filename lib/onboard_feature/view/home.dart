import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add your notification button action here
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // Add your chat button action here
            },
          ),
        ],
        title: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Pencarian',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 4.0),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
