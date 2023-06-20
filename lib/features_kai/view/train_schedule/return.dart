import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/station/departure_provider.dart';
import '../../view_model/station/return_provider.dart';

class ReturnPage extends StatefulWidget {
  const ReturnPage({super.key});

  @override
  State<ReturnPage> createState() => _ReturnState();
}

class _ReturnState extends State<ReturnPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => Provider.of<ReturnProvider>(context, listen: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReturnPage'),
      ),
      body: Consumer<DepartureProvider>(
        builder: (context, data, _) {
          if (data.departure.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: data.departure.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.departure[index].name.toString()),
                      Text(data.departure[index].price.toString())
                    ],
                  ),
                  subtitle: Text(data.departure[index].datumClass.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
