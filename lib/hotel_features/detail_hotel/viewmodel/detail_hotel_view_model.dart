import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../model/detail_hotel_model.dart';

class DetailHotelViewModel extends ChangeNotifier {
  final DetailHotel htl;
  bool likeActive;
  bool dislikeActive;

  DetailHotelViewModel({
    required this.htl,
    this.likeActive = false,
    this.dislikeActive = false,
  });

  void handleLikePressed() {
    likeActive = !likeActive;
    dislikeActive = false;
    // Logic
  }

  void handleDislikePressed() {
    dislikeActive = !dislikeActive;
    likeActive = false;
    // Logic 
  }
}




