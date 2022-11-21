// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    Post({
        required this.id,
        required this.title,
        required this.description,
        required this.user,
        required this.price,
        required this.isAskPrice,
        required this.typePost,
        required this.maker,
        required this.model,
        required this.colour,
        required this.years,
        required this.bodyType,
        required this.transmissionType,
        required this.kilometrage,
        required this.gasType,
        required this.doors,
        required this.engineCylinders,
        required this.condition,
        required this.numberOfOwners,
        required this.numberOfAccidents,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String title;
    String description;
    User user;
    int price;
    bool isAskPrice;
    String typePost;
    String maker;
    String model;
    String colour;
    int years;
    BodyType bodyType;
    String transmissionType;
    int kilometrage;
    String gasType;
    int doors;
    int engineCylinders;
    String condition;
    int numberOfOwners;
    int numberOfAccidents;
    DateTime createdAt;
    DateTime updatedAt;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        user: User.fromJson(json["user"]),
        price: json["price"],
        isAskPrice: json["is_ask_price"],
        typePost: json["type_post"],
        maker: json["maker"],
        model: json["model"],
        colour: json["colour"],
        years: json["years"],
        bodyType: BodyType.fromJson(json["body_type"]),
        transmissionType: json["transmission_type"],
        kilometrage: json["kilometrage"],
        gasType: json["gas_type"],
        doors: json["doors"],
        engineCylinders: json["engine_cylinders"],
        condition: json["condition"],
        numberOfOwners: json["number_of_owners"],
        numberOfAccidents: json["number_of_accidents"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "user": user.toJson(),
        "price": price,
        "is_ask_price": isAskPrice,
        "type_post": typePost,
        "maker": maker,
        "model": model,
        "colour": colour,
        "years": years,
        "body_type": bodyType.toJson(),
        "transmission_type": transmissionType,
        "kilometrage": kilometrage,
        "gas_type": gasType,
        "doors": doors,
        "engine_cylinders": engineCylinders,
        "condition": condition,
        "number_of_owners": numberOfOwners,
        "number_of_accidents": numberOfAccidents,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

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

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.createdAt,
    });

    int id;
    String name;
    String email;
    int phone;
    DateTime createdAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
    };
}
