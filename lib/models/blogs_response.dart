class Blogs {
  String? type;
  String? message;
  Data? data;

  Blogs({this.type, this.message, this.data});

  Blogs.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Plants>? plants;

  Data({this.plants});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = <Plants>[];
      json['plants'].forEach((v) {
        plants!.add(new Plants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plants != null) {
      data['plants'] = this.plants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plants {
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  Plants(
      {this.plantId,
      this.name,
      this.description,
      this.imageUrl,
      this.waterCapacity,
      this.sunLight,
      this.temperature});

  Plants.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plantId'] = this.plantId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['waterCapacity'] = this.waterCapacity;
    data['sunLight'] = this.sunLight;
    data['temperature'] = this.temperature;
    return data;
  }
}