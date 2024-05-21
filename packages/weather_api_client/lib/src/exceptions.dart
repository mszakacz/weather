/// Exception thrown when getWeather request fails.
class GetWeatherForecastFailure implements Exception {}

/// Exception thrown when WeatherForecast from json fails.
class WeatherForecastDeserializationFailure implements Exception {}

/// Exception thrown when getLocations request fails.
class GetLocationsFailure implements Exception {}

/// Exception thrown when LocationData from json fails.
class LocationDataDeserializationFailure implements Exception {}
