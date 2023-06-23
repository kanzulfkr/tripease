class PaymentMethod {
  final String title;
  final String imageAsset;
  final List<String> howTo;
  final String subtitle;

  PaymentMethod(this.title, this.imageAsset, this.howTo, this.subtitle);
}


class VirtualAccountOption {
  final String title;
  final String imageAsset;
  final String vaNumber;
  final List<String> howTo;

  VirtualAccountOption({required this.title, required this.imageAsset, required this.vaNumber, required this.howTo});
}


class MinimarketOption {
  final String title;
  final String imageAsset;
  final String paymentCode;
  final List<String> howTo;

  MinimarketOption({required this.title, required this.imageAsset, required this.paymentCode, required this.howTo});
}



