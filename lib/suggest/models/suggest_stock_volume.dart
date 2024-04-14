import 'package:flutter/material.dart';

class StockVolume {
  String? date;
  late Color color;
  late int volume;

  StockVolume({
    this.date,
    required this.color,
    required this.volume,
  });

  StockVolume.fromChart(String? pDate, int pVolume, Color pColor) {
    date = pDate;
    volume = pVolume;
    color = pColor;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['date'] = date;
    data['volume'] = volume;
    data['color'] = color;

    return data;
  }
}
