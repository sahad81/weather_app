class Coord {
  final double? lon;
  final double? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(dynamic json) {
    if (json == null) {
      return Coord();
    }

    return Coord(lat: json['lat'], lon: json["lon"]);
  }
}
