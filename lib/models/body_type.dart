import 'package:meta/meta.dart';
import 'dart:convert';

List<BodyType> bodyTypeFromJson(String str) => List<BodyType>.from(json.decode(str).map((x) => BodyType.fromJson(x)));

String bodyTypeToJson(List<BodyType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BodyType {
    BodyType({
        required this.id,
        required this.name,
        required this.icon,
    });

    int id;
    String name;
    String icon;

    factory BodyType.fromJson(Map<String, dynamic> json) => BodyType(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
    };
}
