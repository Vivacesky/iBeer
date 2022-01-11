import 'package:equatable/equatable.dart';
import 'package:i_beer/common/common.dart';

class BreweryViewModel extends Equatable {
  final String id;
  final String name;
  final String address;
  final String city;
  final String country;

  const BreweryViewModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.country,
  });

  @override
  List<Object> get props => [
        id,
        name,
        address,
        city,
        country,
      ];

  factory BreweryViewModel.orThrow({
    required String? id,
    required String? name,
    required String? address,
    required String? city,
    required String? country,
  }) {
    return BreweryViewModel(
      id: validateNotNull('id', id),
      name: validateNotNull('name', name),
      address: validateNotNull("address", address),
      city: validateNotNull("city", city),
      country: validateNotNull("country", country),
    );
  }
}
