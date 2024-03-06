abstract class ApiConstants {
  static const weatherApiUrl = "https://api.openweathermap.org";
  static const weatherApiKey = String.fromEnvironment("owm-appid");

  static const locationApiUrl = "https://api.placekit.co";
  static const locationApiKey = String.fromEnvironment("pk-apikey");
}
