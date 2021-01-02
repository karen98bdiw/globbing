import '../models/deliverCountryModel.dart';

class DeliveryCountries {
  static final List<DeliveryCountryModel> countries = [
    DeliveryCountryModel(
      name: "USA",
      iconAssets: "assets/images/usa.png",
      deliveryMethonds: [
        DeliveryMethod(
          type: DelivieryType.Express,
          duration: "5-10 bus.days",
        ),
        DeliveryMethod(
          type: DelivieryType.Standard,
          duration: "2,5 months",
        ),
      ],
    ),
    DeliveryCountryModel(
      name: "United Kingdom",
      iconAssets: "assets/images/united-kingdom.png",
      deliveryMethonds: [],
    ),
    DeliveryCountryModel(
      name: "China",
      iconAssets: "assets/images/china.png",
      deliveryMethonds: [
        DeliveryMethod(
          type: DelivieryType.Express,
          duration: "5-10 bus.days",
        ),
        DeliveryMethod(
          type: DelivieryType.Groud,
          duration: "22 bus.days",
        ),
        DeliveryMethod(
          type: DelivieryType.Standard,
          duration: "1,5 months",
        ),
      ],
    ),
    DeliveryCountryModel(
      name: "Germany",
      iconAssets: "assets/images/germany.png",
      deliveryMethonds: [],
    ),
    DeliveryCountryModel(
      name: "Italy",
      iconAssets: "assets/images/italy.png",
      deliveryMethonds: [],
    ),
    DeliveryCountryModel(
      name: "Dubai",
      iconAssets: "assets/images/uae.png",
      deliveryMethonds: [
        DeliveryMethod(
          type: DelivieryType.Express,
          duration: "5-10 bus.days",
        ),
        DeliveryMethod(
          type: DelivieryType.Standard,
          duration: "20 bus.days",
        ),
      ],
    ),
    DeliveryCountryModel(
      name: "Russia",
      iconAssets: "assets/images/russia.png",
      deliveryMethonds: [
        DeliveryMethod(
          type: DelivieryType.Express,
          duration: "2,5 bus.days",
        ),
        DeliveryMethod(
          type: DelivieryType.Standard,
          duration: "5-10 bus.days",
        ),
      ],
    ),
  ];
}
