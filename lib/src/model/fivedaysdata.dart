class FiveDaysss {
  final String? dateTime;
  final int? temp;

  FiveDaysss({this.dateTime, this.temp});

  factory FiveDaysss.fromJson(dynamic json) {
    if (json == null) {
      return FiveDaysss();
    }

    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';
    return FiveDaysss(
      dateTime: fandl,
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
}
