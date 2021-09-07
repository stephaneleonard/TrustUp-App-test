import 'dart:convert';
import 'package:http/http.dart' as http;

class Count {
  Count(
      {required this.pending,
      required this.inProgress,
      required this.quoted,
      required this.declined,
      required this.won,
      required this.lost,
      required this.all});

  Count.fromJson(Map<String, dynamic> json) {
    pending = json['pending'] as int;
    inProgress = json['in-progress'] as int;
    quoted = json['quoted'] as int;
    declined = json['declined'] as int;
    won = json['won'] as int;
    lost = json['lost'] as int;
    all = json['all'] as int;
  }

  int pending = 0;
  int inProgress = 0;
  int quoted = 0;
  int declined = 0;
  int won = 0;
  int lost = 0;
  int all = 0;
}

Future<Count> fetchRequestCount() async {
  final dynamic res = await http.get(
    Uri.parse(
        'https://stephane-leonard-test-flutter-api.trustup.dev/api/requests/count'),
  );
  if (res.statusCode == 200) {
    final dynamic data = jsonDecode(res.body as String);
    final Count count = Count.fromJson(data['data'] as Map<String, dynamic>);
    return count;
  } else {
    throw Error();
  }
}
