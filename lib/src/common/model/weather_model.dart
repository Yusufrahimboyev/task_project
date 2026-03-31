class WeatherForecast {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherList>? list;
  final City? city;

  WeatherForecast({this.cod, this.message, this.cnt, this.list, this.city});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: json['list'] != null
          ? (json['list'] as List).map((i) => WeatherList.fromJson(i)).toList()
          : null,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
    );
  }
}

class WeatherList {
  final int? dt;
  final MainData? main;
  final List<Weather>? weather;
  final Wind? wind;
  final double? pop;
  final String? dtTxt;

  WeatherList({
    this.dt,
    this.main,
    this.weather,
    this.wind,
    this.pop,
    this.dtTxt,
  });

  factory WeatherList.fromJson(Map<String, dynamic> json) {
    return WeatherList(
      dt: json['dt'],
      main: json['main'] != null ? MainData.fromJson(json['main']) : null,
      weather: json['weather'] != null
          ? (json['weather'] as List).map((i) => Weather.fromJson(i)).toList()
          : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      pop: (json['pop'] as num?)?.toDouble(),
      dtTxt: json['dt_txt'],
    );
  }
}

class MainData {
  final double? temp;
  final double? feelsLike;
  final int? pressure;
  final int? humidity;

  MainData({this.temp, this.feelsLike, this.pressure, this.humidity});

  factory MainData.fromJson(Map<String, dynamic> json) {
    return MainData(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Wind {
  final double? speed;
  final int? deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: (json['speed'] as num?)?.toDouble(), deg: json['deg']);
  }
}

class City {
  final String? name;
  final String? country;

  City({this.name, this.country});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(name: json['name'], country: json['country']);
  }
}
