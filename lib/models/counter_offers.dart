import 'dart:convert';

import 'package:wheels/models/post.dart';
import 'package:wheels/models/user.dart';

List<CounterOffers> counterOffersFromJson(String str) => List<CounterOffers>.from(json.decode(str).map((x) => CounterOffers.fromJson(x)));

String counterOffersToJson(List<CounterOffers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CounterOffers {
    CounterOffers({
        required this.id,
        required this.price,
        required this.post,
        required this.user,
        required this.createdAt,
    });

    int id;
    int price;
    Post post;
    User user;
    DateTime createdAt;

    factory CounterOffers.fromJson(Map<String, dynamic> json) => CounterOffers(
        id: json["id"],
        price: json["price"],
        post: Post.fromJson(json["post"]),
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "post": post.toJson(),
        "user": user.toJson(),
        "created_at": createdAt.toIso8601String(),
    };
}