class DetailHotel {
  String name;
  String location;
  String description;
  List<String> amenities;
  List<Review> reviews;
  List<Policy> policies;
  List<Room> rooms;

  DetailHotel({
    required this.name,
    required this.location,
    required this.description,
    required this.amenities,
    required this.reviews,
    required this.policies,
    required this.rooms,
  });
}

class Policy {
  String type;
  List<String> desc;

  Policy ({
    required this.type,
    required this.desc
  });
}

class Review {
  String author;
  String rating;
  String date;
  String comment;

  Review({
    required this.author,
    required this.rating,
    required this.date,
    required this.comment,
  });
}

class Room {
  String name;
  String price;
  List<String> imageUrls;
  String capacity;
  String bedType;
  String breakfast;
  String refund;
  String wifi;
  String reSchedule;
  String noSmoking;
  String navigateUrl;
  String deskripsi;
  List<String> fasilitas;
  String asuransi;
  String subtotal;
  String total;
  bool isChecked = false;


  Room({
    required this.name,
    required this.price,
    required this.imageUrls,
    required this.capacity,
    required this.bedType,
    required this.breakfast,
    required this.refund,
    required this.wifi,
    required this.reSchedule,
    required this.noSmoking,
    required this.navigateUrl,
    required this.deskripsi,
    required this.fasilitas,
    required this.asuransi,
    required this.subtotal,
    required this.total
  });
}

List<String> hotelAssetsList = [
  'assets/images/detail_h1.jpeg',
  'assets/images/detail_h1.jpeg',
  'assets/images/detail_h1.jpeg',
];
