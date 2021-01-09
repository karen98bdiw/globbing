import '../models/adress.dart';
import '../providers/userStateProvider.dart';
import '../providers/deliveriCountriesProvider.dart';

class AdressesProvider {
  static final List<Adress> adresses = [
    Adress(
      country: DeliveryCountries.countries[0], //USA
      recepient:
          "${UserStateProvider.curentUser.name} ${UserStateProvider.curentUser.surname}",
      adress: "950 Ridge RD C25",
      adress2: "A223572",
      state: "DE",
      city: "Claymont",
      postalCode: "19703",
      phone: "+13024148597",
    )
  ];

  Adress getAdressForCountry() {
    //TODO:will got country and return adress for gived country;
  }
}
