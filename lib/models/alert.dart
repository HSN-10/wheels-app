import 'dart:convert';

List<Alert> alertFromJson(String str) => List<Alert>.from(json.decode(str).map((x) => Alert.fromJson(x)));

String alertToJson(List<Alert> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Alert {
    Alert({
        required this.id,
        required this.userId,
        required this.priceFrom,
        required this.priceTo,
        this.maker,
        this.model,
        this.colour,
        this.years,
        this.bodyTypeId,
        this.transmissionType,
        this.kilometrage,
        this.gasType,
        this.doors,
        this.engineCylinders,
        this.condition,
        required this.createdAt,
        required this.updatedAt,
        this.deletedAt,
    });

    int id;
    int userId;
    int priceFrom;
    int priceTo;
    dynamic maker;
    dynamic model;
    dynamic colour;
    dynamic years;
    dynamic bodyTypeId;
    dynamic transmissionType;
    dynamic kilometrage;
    dynamic gasType;
    dynamic doors;
    dynamic engineCylinders;
    dynamic condition;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        id: json["id"],
        userId: json["user_id"],
        priceFrom: json["price_from"],
        priceTo: json["price_to"],
        maker: json["maker"],
        model: json["model"],
        colour: json["colour"],
        years: json["years"],
        bodyTypeId: json["body_type_id"],
        transmissionType: json["transmission_type"],
        kilometrage: json["kilometrage"],
        gasType: json["gas_type"],
        doors: json["doors"],
        engineCylinders: json["engine_cylinders"],
        condition: json["condition"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "price_from": priceFrom,
        "price_to": priceTo,
        "maker": maker,
        "model": model,
        "colour": colour,
        "years": years,
        "body_type_id": bodyTypeId,
        "transmission_type": transmissionType,
        "kilometrage": kilometrage,
        "gas_type": gasType,
        "doors": doors,
        "engine_cylinders": engineCylinders,
        "condition": condition,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
