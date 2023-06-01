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
        element.update("status", (value) => "available");
      });
    });
  }

  void gantiGerbong(int indexGerbongTerpilih) {
    indexGerbong.value = indexGerbongTerpilih;
    gerbong.refresh();
  }

  RxList<int> selectedSeatIndices =
      RxList<int>([]); // Daftar indeks kursi yang dipilih

  List<int> previouslySelectedSeatIndices =
      []; // Daftar indeks kursi yang dipilih sebelumnya

  void selectKursi(int index) {
    if (selectedSeatIndices.length == 1) {
      previouslySelectedSeatIndices = List.from(
          selectedSeatIndices); // Menyimpan kursi yang dipilih sebelumnya
    }

    if (selectedSeatIndices.contains(index)) {
      selectedSeatIndices.remove(index);
    } else {
      selectedSeatIndices.add(index);
    }

    gerbong.refresh();
  }

  var gerbong = List.generate(
    6,
    (indexG) => List<Map<String, dynamic>>.generate(
      105,
      (indexK) {
        return {
          "id": "ID-${indexG + 1}-${indexK + 1}",
          "status": "available",
        };
      },
    ),
  ).obs;
}
