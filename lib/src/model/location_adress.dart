// ignore_for_file: non_constant_identifier_names

class LocationAdress {
  String? street_number;
  String? route;
  String? sublocality_level_1;
  String? administrative_area_level_1;
  String? administrative_area_level_2;
  String? country;
  String? postal_code;

  LocationAdress({
    this.street_number,
    this.route,
    this.sublocality_level_1,
    this.administrative_area_level_1,
    this.administrative_area_level_2,
    this.country,
    this.postal_code,
  });

  LocationAdress copyWith({
    String? street_number,
    String? route,
    String? sublocality_level_1,
    String? administrative_area_level_1,
    String? administrative_area_level_2,
    String? country,
    String? postal_code,
  }) {
    return LocationAdress(
      street_number: street_number ?? this.street_number,
      route: route ?? this.route,
      sublocality_level_1: sublocality_level_1 ?? this.sublocality_level_1,
      administrative_area_level_1:
          administrative_area_level_1 ?? this.administrative_area_level_1,
      administrative_area_level_2:
          administrative_area_level_2 ?? this.administrative_area_level_2,
      country: country ?? this.country,
      postal_code: postal_code ?? this.postal_code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street_number': street_number,
      'route': route,
      'sublocality_level_1': sublocality_level_1,
      'administrative_area_level_1': administrative_area_level_1,
      'administrative_area_level_2': administrative_area_level_2,
      'country': country,
      'postal_code': postal_code,
    };
  }

  factory LocationAdress.fromMap(Map<String, dynamic>? map) {
    if (map == null) return LocationAdress();

    LocationAdress l = LocationAdress();

    List address_components = map['address_components'];

    address_components.forEach((component) {
      List types = component['types'];
      String long_name = component['long_name'];
      // String short_name = component['short_name'];

      if (types.contains('street_number')) {
        l.street_number = long_name;
      }
      if (types.contains('route')) {
        l.route = long_name;
      }
      if (types.contains('sublocality_level_1')) {
        l.sublocality_level_1 = long_name;
      }
      if (types.contains('administrative_area_level_1')) {
        l.administrative_area_level_1 = long_name;
      }
      if (types.contains('administrative_area_level_2')) {
        l.administrative_area_level_2 = long_name;
      }
      if (types.contains('country')) {
        l.country = long_name;
      }
      if (types.contains('postal_code')) {
        l.postal_code = long_name;
      }
    });

    return l;
  }

  @override
  String toString() {
    return 'LocationAdress(street_number: $street_number, route: $route, sublocality_level_1: $sublocality_level_1, administrative_area_level_1: $administrative_area_level_1, administrative_area_level_2: $administrative_area_level_2, country: $country, postal_code: $postal_code)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LocationAdress &&
        o.street_number == street_number &&
        o.route == route &&
        o.sublocality_level_1 == sublocality_level_1 &&
        o.administrative_area_level_1 == administrative_area_level_1 &&
        o.administrative_area_level_2 == administrative_area_level_2 &&
        o.country == country &&
        o.postal_code == postal_code;
  }

  @override
  int get hashCode {
    return street_number.hashCode ^
        route.hashCode ^
        sublocality_level_1.hashCode ^
        administrative_area_level_1.hashCode ^
        administrative_area_level_2.hashCode ^
        country.hashCode ^
        postal_code.hashCode;
  }
}
