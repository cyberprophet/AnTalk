class ChartModel {
  String? date;
  late int current;
  late int high;
  late int low;
  late int start;
  late int volume;

  ChartModel({
    this.date,
    required this.current,
    required this.high,
    required this.low,
    required this.start,
    required this.volume,
  });

  ChartModel.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String) {
      date = json["date"];
    }
    current = json["current"];
    high = json["high"];
    low = json["low"];
    start = json["start"];
    volume = json["volume"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["date"] = date;
    data["current"] = current;
    data["high"] = high;
    data["low"] = low;
    data["start"] = start;
    data["volume"] = volume;

    return data;
  }
}
