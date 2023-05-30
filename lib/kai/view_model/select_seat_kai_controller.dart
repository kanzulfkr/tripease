import 'package:get/get.dart';

class SelectSeatKaiController extends GetxController {
  var indexGerbong = 0.obs;
  final List<String> stringList = [
    'Penumpang 1 | Eko1 - 3A',
    'Penumpang 2 | Eko1 - 3B',
    'Penumpang 3 | Eko1 - 3C',
    'Penumpang 4 | Eko1 - 3D',
  ];
  RxList<String> selectedValue = RxList<String>(['Penumpang 1 | Eko1 - 3A']);
  RxString containerValue = RxString('');

  void updateSelectedValue(String newValue) {
    selectedValue.add(newValue);
  }

  void reset() {
    gerbong.forEach((element) {
      element.forEach((element) {
        if (element["status"] != "filled") {
          element.update("status", (value) => "available");
        }
      });
    });
  }

  void gantiGerbong(int indexGerbongTerpilih) {
    indexGerbong.value = indexGerbongTerpilih;
    gerbong.refresh();
  }

  void selectKursi(int indexKursiTerpilih) {
    print(gerbong[indexGerbong.value][indexKursiTerpilih]);
    if (gerbong[indexGerbong.value][indexKursiTerpilih]["status"] ==
        "available") {
      reset();
      gerbong[indexGerbong.value][indexKursiTerpilih]
          .update("status", (value) => "selected");
    }
    gerbong.refresh();
  }

  var gerbong = List.generate(
    6,
    (indexG) => List<Map<String, dynamic>>.generate(
      105,
      (indexK) {
        if (indexG == 0) {
          // gerbong ke 1
          if (indexK >= 24 && indexK <= 26 || indexK >= 40 && indexK <= 44) {
            return {
              "id": "ID-${indexG + 1}-${indexK + 1}",
              "status": "filled",
            };
          } else {
            return {
              "id": "ID-${indexG + 1}-${indexK + 1}",
              "status": "available",
            };
          }
        } else if (indexG == 1) {
          // gerbong ke 2
          if (indexK >= 5 && indexK <= 35) {
            return {
              "id": "ID-${indexG + 1}-${indexK + 1}",
              "status": "filled",
            };
          } else {
            return {
              "id": "ID-${indexG + 1}-${indexK + 1}",
              "status": "available",
            };
          }
        } else {
          return {
            "id": "ID-${indexG + 1}-${indexK + 1}",
            "status": "available",
          };
        }
      },
    ),
  ).obs;
}
