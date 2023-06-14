import 'package:capstone_project_tripease/kai/view_model/departure_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Departure extends StatefulWidget {
  const Departure({super.key});

  @override
  State<Departure> createState() => _DepartureState();
}

class _DepartureState extends State<Departure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departure'),
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
