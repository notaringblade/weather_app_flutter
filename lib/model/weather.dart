class Weather{
  String? locationName;
  String? countryName;
  double? temp;
  String? description;
  String? additionalDescription; 
  int? humidity;
  int? error;
  double? wind;
  int? deg;


  Weather({
    this.locationName,
    this.countryName,
    this.temp,
    this.description,
    this.additionalDescription,
    this.humidity,
    this.deg,
    this.wind,
    this.error
  });

  Weather.fromJson(Map<String, dynamic> json){
    locationName = json["name"];
    countryName = json["sys"]["country"];
    temp = json["main"]["temp"];
    description = json["weather"][0]["main"];
    additionalDescription = json["weather"][0]["description"];
    humidity = json["main"]["humidity"];
    wind = json["wind"]["speed"];
    deg = json["wind"]["deg"];
    error = json["cod"];
  }
}
