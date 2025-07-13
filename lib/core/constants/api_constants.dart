import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  // Google API Key từ .env file
  static String get googleApiKey => dotenv.env['GOOGLE_API_KEY'] ?? '';

  // Base URLs
  static const String placesBaseUrl = 'https://places.googleapis.com/v1';

  static const String latLngUrl =
      'https://maps.googleapis.com/maps/api/geocode/json';
  // Endpoints
  static const String placesAutocomplete = '$placesBaseUrl/places:autocomplete';

  static String buildMapUrl(String lat, String lng) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=$googleApiKey';
  }

  static String currentLocationUrl(String lat, String lng) {
    return 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey';
  }

  // Headers
  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'X-Goog-Api-Key': googleApiKey,
  };

  static Map<String, String> get mapsHeaders => {
    'Content-Type': 'application/json',
  };
  static String buildGeocodingUrl(String placeId) {
    return '$latLngUrl?place_id=$placeId&key=$googleApiKey';
  }

  // Default map position (Vietnam center)
  static double get defaultLat =>
      double.parse(dotenv.env['DEFAULT_LAT'] ?? '10.8231');
  static double get defaultLng =>
      double.parse(dotenv.env['DEFAULT_LNG'] ?? '106.6297');

  // Request configurations
  static const List<String> countryCode = ['VN'];
  static const String languageCode = 'vi';
}
