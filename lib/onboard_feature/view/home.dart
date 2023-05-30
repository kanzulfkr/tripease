import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add your notification button action here
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Add your chat button action here
            },
          ),
        ],
        title: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Pencarian',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
              prefixIcon: const Icon(Icons.search),
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
