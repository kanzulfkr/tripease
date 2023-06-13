import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  var seatApiModel = SeatApiModel();

  seatApiModel.dataCarriage1('Ekonomi', 1);
  seatApiModel.dataCarriage2('Bisnis', 1);
  seatApiModel.dataCarriage3('Eksekutif', 1);
}

class SeatApiModel {
  List<Map<String, dynamic>> _listA = [];
  List<Map<String, dynamic>> _listB = [];
  List<Map<String, dynamic>> _listC = [];
  List<Map<String, dynamic>> _listD = [];
  List<Map<String, dynamic>> _listE = [];

  List<Map<String, dynamic>> get listA => _listA;
  List<Map<String, dynamic>> get listB => _listB;
  List<Map<String, dynamic>> get listC => _listC;
  List<Map<String, dynamic>> get listD => _listD;
  List<Map<String, dynamic>> get listE => _listE;

  final _listAController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  final _listBController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  final _listCController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  final _listDController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  final _listEController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  Stream<List<Map<String, dynamic>>> get listAStream => _listAController.stream;
  Stream<List<Map<String, dynamic>>> get listBStream => _listBController.stream;
  Stream<List<Map<String, dynamic>>> get listCStream => _listCController.stream;
  Stream<List<Map<String, dynamic>>> get listDStream => _listDController.stream;
  Stream<List<Map<String, dynamic>>> get listEStream => _listEController.stream;

  Future<void> dataCarriage1(String classParam, int idParam) async {
    var url =
        Uri.parse('https://capstone.hanifz.com/api/v1/public/train-carriage');

    var params = {
      'class': classParam,
      'train_id': idParam.toString(),
    };

    url = url.replace(queryParameters: params);
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var carriages = data['data'];
      for (var carriage in carriages) {
        var gerbong = carriage['name'];
        if (gerbong == 'Eko-1') {
          var seats = data['data'][0]['seat'];

          for (var seat in seats) {
            var id = seat['id'];
            var name = seat['name'];
            var available = seat['available'];

            if (name.startsWith('A')) {
              _listA.add({
                'id': id,
                'name': name,
                'available': available,
              });
              print('Data masuk ke list A: $_listA');

              _listAController.add(_listA);
            } else if (name.startsWith('B')) {
              _listB.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list B: $_listB');
              _listBController.add(_listB);
            } else if (name.startsWith('C')) {
              _listC.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list C: $_listC');
              _listCController.add(_listC);
            } else if (name.startsWith('D')) {
              _listD.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list D: $_listD');
              _listDController.add(_listD);
            } else if (name.startsWith('E')) {
              _listE.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list E: $_listE');
              _listEController.add(_listE);
            } else {
              print('Data tidak masuk ke list ');
            }
          }
        }
      }
    }
  }

  Future<void> dataCarriage2(String classParam, int idParam) async {
    var url =
        Uri.parse('https://capstone.hanifz.com/api/v1/public/train-carriage');

    var params = {
      'class': classParam,
      'train_id': idParam.toString(),
    };

    url = url.replace(queryParameters: params);
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var carriages = data['data'];
      for (var carriage in carriages) {
        var gerbong = carriage['name'];
        if (gerbong == 'Bis-1') {
          var seats = data['data'][0]['seat'];

          for (var seat in seats) {
            var id = seat['id'];
            var name = seat['name'];
            var available = seat['available'];

            if (name.startsWith('A')) {
              _listA.add({
                'id': id,
                'name': name,
                'available': available,
              });
              print('Data masuk ke list A: $_listA');

              _listAController.add(_listA);
            } else if (name.startsWith('B')) {
              _listB.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list B: $_listB');
              _listBController.add(_listB);
            } else if (name.startsWith('C')) {
              _listC.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list C: $_listC');
              _listCController.add(_listC);
            } else if (name.startsWith('D')) {
              _listD.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list D: $_listD');
              _listDController.add(_listD);
            } else if (name.startsWith('E')) {
              _listE.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list E: $_listE');
              _listEController.add(_listE);
            } else {
              print('Data tidak masuk ke list ');
            }
          }
        }
      }
    }
  }

  Future<void> dataCarriage3(String classParam, int idParam) async {
    var url =
        Uri.parse('https://capstone.hanifz.com/api/v1/public/train-carriage');

    var params = {
      'class': classParam,
      'train_id': idParam.toString(),
    };

    url = url.replace(queryParameters: params);
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var carriages = data['data'];
      for (var carriage in carriages) {
        var gerbong = carriage['name'];
        if (gerbong == 'Eks-1') {
          var seats = data['data'][0]['seat'];

          for (var seat in seats) {
            var id = seat['id'];
            var name = seat['name'];
            var available = seat['available'];

            if (name.startsWith('A')) {
              _listA.add({
                'id': id,
                'name': name,
                'available': available,
              });
              print('Data masuk ke list A: $_listA');

              _listAController.add(_listA);
            } else if (name.startsWith('B')) {
              _listB.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list B: $_listB');
              _listBController.add(_listB);
            } else if (name.startsWith('C')) {
              _listC.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list C: $_listC');
              _listCController.add(_listC);
            } else if (name.startsWith('D')) {
              _listD.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list D: $_listD');
              _listDController.add(_listD);
            } else if (name.startsWith('E')) {
              _listE.add({
                'id': id,
                'name': name,
                'available': available,
              });
              // print('Data masuk ke list E: $_listE');
              _listEController.add(_listE);
            } else {
              print('Data tidak masuk ke list ');
            }
          }
        }
      }
    }
  }

  Future<void> updateSeatAvailability(int id, bool available) async {
    // Lakukan logika untuk memperbarui kursi di server
    try {
      final response = await http.patch(
        Uri.parse(
            'https://capstone.hanifz.com/api/v1/public/train-carriage/$id'),
        body: {'available': available.toString()},
      );

      if (response.statusCode == 200) {
        print('Berhasil memperbarui ketersediaan kursi');
      } else {
        print('Gagal memperbarui ketersediaan kursi');
      }
    } catch (error) {
      print('Terjadi kesalahan saat memperbarui ketersediaan kursi: $error');
    }
  }
}
