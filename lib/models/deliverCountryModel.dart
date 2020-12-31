enum DelivieryType {
  Standard,
  Express,
  Groud,
}

class DeliveryMethod {
  final DelivieryType type;
  final String duration;

  DeliveryMethod({this.type, this.duration});
}

class DeliveryCountryModel {
  final String name;
  final String iconAssets;
  List<DeliveryMethod> deliveryMethonds;

  DeliveryCountryModel({
    this.name,
    this.iconAssets,
    this.deliveryMethonds,
  });
}
