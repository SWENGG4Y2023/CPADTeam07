import 'dart:convert';

class LocationData {
  final String id;
  final String locationCode;
  final String country;
  final String city;
  final String building;
  final String region;
  final String name;
  final String address;
  final Map<String, Map<String, dynamic>> availableServices;

  const LocationData({
    required this.locationCode,
    required this.country,
    required this.city,
    required this.building,
    required this.region,
    required this.id,
    required this.name,
    required this.address,
    required this.availableServices,
  });

  static LocationData fromJson(Map<String, dynamic> json) {
    return LocationData(
        id: json["locationId"],
        locationCode: json["locationCode"],
        country: json["country"],
        city: json["city"],
        building: json["branch"] ?? "",
        region: json["region"],
        name: json["name"],
        address: json["address"],
        availableServices: Map<String, Map<String, dynamic>>.from(jsonDecode(json["availableServices"])));
  }

  static List<LocationData> fromJsonList(List<dynamic> json) {
    return json.map((location) => LocationData.fromJson(location)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "locationId": id,
      "locationCode": locationCode,
      "country": country,
      "city": city,
      "building": building,
      "region": region,
      "name": name,
      "address": address,
      "availableServices": availableServices,
    };
  }

  static List<Map<String, dynamic>> toJsonList(List<LocationData> locations) {
    return locations.map((location) => location.toJson()).toList();
  }
}
