// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // void main() {
// //   var seatApiModel = SeatApiModel();
// //   seatApiModel.fetchData();

// //   // Mengakses listA dari instance SeatApiModel
// //   print('List A: ${seatApiModel.listA}');
// // }

// // class SeatApiModel {
// //   List<Map<String, dynamic>> _listA = [];
// //   List<String> _listB = [];
// //   List<String> _listC = [];
// //   List<String> _listD = [];
// //   List<String> _listE = [];

// //   List<Map<String, dynamic>> get listA => _listA;
// //   List<String> get listB => _listB;
// //   List<String> get listC => _listC;
// //   List<String> get listD => _listD;
// //   List<String> get listE => _listE;

// //   Future<void> fetchData() async {
// //     var url =
// //         Uri.parse('https://capstone.hanifz.com/api/v1/public/train-carriage/1');
// //     var response = await http.get(url);

// //     if (response.statusCode == 200) {
// //       // Request successful, parse the response
// //       var data = json.decode(response.body);
// //       var seats = data['data']['seat'];

// //       for (var seat in seats) {
// //         var id = seat['id'];
// //         var name = seat['name'];

// //         print('ID: $id');
// //         print('Name: $name');

// //         if (name.startsWith('A')) {
// //           _listA.add({
// //             'id': id,
// //             'name': name,
// //           });
// //           print('Data masuk ke list A: $_listA');
// //         } else if (name.startsWith('B')) {
// //           _listB.add(name);
// //           print('Data masuk ke list B: $_listB');
// //         } else if (name.startsWith('C')) {
// //           _listC.add(name);
// //           print('Data masuk ke list C: $_listC');
// //         } else if (name.startsWith('D')) {
// //           _listD.add(name);
// //           print('Data masuk ke list D: $_listD');
// //         } else if (name.startsWith('E')) {
// //           _listE.add(name);
// //           print('Data masuk ke list E: $_listE');
// //         } else {
// //           print('Data tidak masuk ke list ');
// //         }

// //       }
// //     } else {
// //       // Request failed
// //       print('Request failed with status: ${response.statusCode}.');
// //     }
// //   }
// // }
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() {
//   var seatApiModel = SeatApiModel();
//   seatApiModel.dataEkonomi();
// }

// class SeatApiModel {
//   List<Map<String, dynamic>> _listA = [];
//   List<Map<String, dynamic>> _listB = [];
//   List<Map<String, dynamic>> _listC = [];
//   List<Map<String, dynamic>> _listD = [];
//   List<Map<String, dynamic>> _listE = [];

//   List<Map<String, dynamic>> get listA => _listA;
//   List<Map<String, dynamic>> get listB => _listB;
//   List<Map<String, dynamic>> get listC => _listC;
//   List<Map<String, dynamic>> get listD => _listD;
//   List<Map<String, dynamic>> get listE => _listE;

//   final _listAController =
//       StreamController<List<Map<String, dynamic>>>.broadcast();
//   final _listBController =
//       StreamController<List<Map<String, dynamic>>>.broadcast();
//   final _listCController =
//       StreamController<List<Map<String, dynamic>>>.broadcast();
//   final _listDController =
//       StreamController<List<Map<String, dynamic>>>.broadcast();
//   final _listEController =
//       StreamController<List<Map<String, dynamic>>>.broadcast();
//   Stream<List<Map<String, dynamic>>> get listAStream => _listAController.stream;
//   Stream<List<Map<String, dynamic>>> get listBStream => _listBController.stream;
//   Stream<List<Map<String, dynamic>>> get listCStream => _listCController.stream;
//   Stream<List<Map<String, dynamic>>> get listDStream => _listDController.stream;
//   Stream<List<Map<String, dynamic>>> get listEStream => _listEController.stream;

//   Future<void> dataEkonomi() async {
//     var url =
//         Uri.parse('https://capstone.hanifz.com/api/v1/public/train-carriage/1');
//     var response = await http.get(url);

//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       var seats = data['data']['seat'];

//       for (var seat in seats) {
//         var id = seat['id'];
//         var name = seat['name'];

//         print('ID: $id');
//         print('Name: $name');

//         if (name.startsWith('A')) {
//           _listA.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list A: $_listA');

//           _listAController.add(_listA);
//         } else if (name.startsWith('B')) {
//           _listB.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list B: $_listB');
//           _listBController.add(_listB);
//         } else if (name.startsWith('C')) {
//           _listC.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list C: $_listC');
//           _listCController.add(_listC);
//         } else if (name.startsWith('D')) {
//           _listD.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list D: $_listD');
//           _listDController.add(_listD);
//         } else if (name.startsWith('E')) {
//           _listE.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list E: $_listE');
//           _listEController.add(_listE);
//         } else {
//           print('Data tidak masuk ke list ');
//         }
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }

//   Future<void> dataBisnis() async {
//     var url =
//         Uri.parse('https://capstone.hanifz.com/api/v1/public/train-carriage/3');
//     var response = await http.get(url);

//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       var seats = data['data']['seat'];

//       for (var seat in seats) {
//         var id = seat['id'];
//         var name = seat['name'];

//         print('ID: $id');
//         print('Name: $name');

//         if (name.startsWith('A')) {
//           _listA.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list A: $_listA');

//           _listAController.add(_listA);
//         } else if (name.startsWith('B')) {
//           _listB.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list B: $_listB');
//           _listBController.add(_listB);
//         } else if (name.startsWith('C')) {
//           _listC.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list C: $_listC');
//           _listCController.add(_listC);
//         } else if (name.startsWith('D')) {
//           _listD.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list D: $_listD');
//           _listDController.add(_listD);
//         } else if (name.startsWith('E')) {
//           _listE.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list E: $_listE');
//           _listEController.add(_listE);
//         } else {
//           print('Data tidak masuk ke list ');
//         }
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }

//   Future<void> dataEksekutif() async {
//     var url =
//         Uri.parse('https://capstone.hanifz.com/api/v1/public/train-carriage/2');
//     var response = await http.get(url);

//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       var seats = data['data']['seat'];

//       for (var seat in seats) {
//         var id = seat['id'];
//         var name = seat['name'];

//         print('ID: $id');
//         print('Name: $name');

//         if (name.startsWith('A')) {
//           _listA.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list A: $_listA');

//           _listAController.add(_listA);
//         } else if (name.startsWith('B')) {
//           _listB.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list B: $_listB');
//           _listBController.add(_listB);
//         } else if (name.startsWith('C')) {
//           _listC.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list C: $_listC');
//           _listCController.add(_listC);
//         } else if (name.startsWith('D')) {
//           _listD.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list D: $_listD');
//           _listDController.add(_listD);
//         } else if (name.startsWith('E')) {
//           _listE.add({
//             'id': id,
//             'name': name,
//           });
//           print('Data masuk ke list E: $_listE');
//           _listEController.add(_listE);
//         } else {
//           print('Data tidak masuk ke list ');
//         }
//       }
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }

//   void dispose() {
//     _listAController.close();
//     _listBController.close();
//     _listCController.close();
//     _listDController.close();
//     _listEController.close();
//   }
// }
