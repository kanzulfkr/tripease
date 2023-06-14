import 'package:capstone_project_tripease/kai/view_model/departure_provider.dart';
import 'package:capstone_project_tripease/kai/view_model/return_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<DepartureViewModel>(
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
                      Text(data.departure[index].name),
                      Text(data.departure[index].price.toString())
                    ],
                  ),
                  subtitle: Text(data.departure[index].datumClass),
                );
              },
            );
          }
        },
      ),
    );
  }
}
