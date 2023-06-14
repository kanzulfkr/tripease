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

  VirtualAccountOption({required this.title, required this.imageAsset, required this.vaNumber});
}


class MinimarketOption {
  final String title;
  final String imageAsset;

  MinimarketOption({required this.title, required this.imageAsset});
}


