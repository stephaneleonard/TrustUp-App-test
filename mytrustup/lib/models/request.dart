import 'dart:convert';
import 'package:http/http.dart' as http;

class Request {
  Request({
    required this.id,
    required this.title,
    required this.status,
    required this.receivedAt,
    this.user,
    this.address,
  });

  Request.fromJson(Map<String, dynamic> json) {
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

Future<List<Request>> fetchRequest(String? type) async {
  final List<Request> list = <Request>[];
  final dynamic res = await http.get(
    Uri.parse(
        'https://stephane-leonard-test-flutter-api.trustup.dev/api/requests/${type ?? ''}'),
  );
  if (res.statusCode == 200) {
    final dynamic data = jsonDecode(res.body as String);
    data['requests'].forEach((dynamic v) {
      try {
        list.add(Request.fromJson(v as Map<String, dynamic>));
        // ignore: empty_catches
      } catch (e) {}
    });
    return list;
  } else {
    throw Error();
  }
}
