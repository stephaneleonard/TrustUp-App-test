import 'package:flutter/material.dart';

class Demandes extends StatelessWidget {
  const Demandes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        RequestCount(),
      ],
    );
  }
}

class RequestCount extends StatelessWidget {
  const RequestCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Mes demandes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          )
        ],
      ),
    );
  }
}
