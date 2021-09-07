class Requests {
  Requests({
    required this.id,
    required this.title,
    required this.status,
    required this.receivedAt,
    this.user,
    this.address,
  });

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'] as String;
    user = json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    address = json['address'] != null
        ? Address.fromJson(json['address'] as Map<String, dynamic>)
        : null;
    status = json['status'] as String;
    receivedAt = json['received_at'] as String;
  }

  late int id;
  late String title;
  User? user;
  Address? address;
  late String status;
  late String receivedAt;
}

class User {
  User({required this.name, required this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    avatar = json['avatar'] as String;
  }

  late String name;
  late String avatar;
}

class Address {
  Address({required this.city, required this.postalCode});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'] as String;
    postalCode = json['postal_code'] as String;
  }

  late String city;
  late String postalCode;
}
