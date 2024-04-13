class SuggestStock {
  String? code;
  String? name;
  late int salesRank;
  late int opRank;
  late int npRank;
  late int rank;

  SuggestStock({
    this.code,
    this.name,
    required this.salesRank,
    required this.opRank,
    required this.npRank,
    required this.rank,
  });

  SuggestStock.fromJson(Map<String, dynamic> json) {
    if (json["code"] is String) {
      code = json["code"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    salesRank = json["salesRank"];
    opRank = json["opRank"];
    npRank = json["npRank"];
    rank = json["rank"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["code"] = code;
    data["salesRank"] = salesRank;
    data["opRank"] = opRank;
    data["npRank"] = npRank;
    data["name"] = name;
    data["rank"] = rank;

    return data;
  }
}
