import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytrustup/cubit/requests_cubit.dart';
import 'package:mytrustup/cubit/selected_type_cubit.dart';
import 'package:mytrustup/models/request.dart';

class RequestListWrapper extends StatelessWidget {
  const RequestListWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedTypeCubit, int>(
        builder: (BuildContext context, int state) {
      const List<String?> list = <String?>[
        null,
        'pending',
        'in-progress',
        'quoted',
        'declined',
        'won',
        'lost',
      ];
      return RequestsList(
        type: list[state],
      );
    });
  }
}

class RequestsList extends StatelessWidget {
  const RequestsList({required this.type, Key? key}) : super(key: key);

  final String? type;

  @override
  Widget build(BuildContext context) {
    context.read<RequestsCubit>().getRequests(type);
    return BlocBuilder<RequestsCubit, RequestsState>(
        builder: (BuildContext context, RequestsState state) {
      if (state is RequestsLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is RequestsLoaded) {
        return ListView.builder(
            itemCount: state.requests.length,
            itemBuilder: (BuildContext context, int id) {
              return RequestTile(request: state.requests[id]);
            });
      }
      if (state is RequestsError) {
        return Text('error: ${state.message}');
      }
      return const Text('undifined error');
    });
  }
}

class RequestTile extends StatelessWidget {
  const RequestTile({required this.request, Key? key}) : super(key: key);

  final Request request;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key(request.id.toString()),
        background: const Reject(),
        child: RequestInfos(
          request: request,
        ));
  }
}

class RequestInfos extends StatelessWidget {
  const RequestInfos({required this.request, Key? key}) : super(key: key);

  final Request request;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/demande');
      },
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Avatar(user: request.user),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UserName(
                        user: request.user,
                      ),
                      Text(
                        request.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      AdressText(adress: request.address)
                    ],
                  )
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({required this.user, Key? key}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Text('User no longer existing');
    }
    return Text(
      user!.name,
      style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
    );
  }
}

class AdressText extends StatelessWidget {
  const AdressText({required this.adress, Key? key}) : super(key: key);

  final Address? adress;

  @override
  Widget build(BuildContext context) {
    if (adress == null) {
      return const Text('Adress no longer existing');
    }
    return Row(
      children: <Widget>[
        const Icon(
          Icons.location_on_outlined,
          color: Colors.grey,
        ),
        Text(
          '${adress!.postalCode} - ${adress!.city}',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({required this.user, Key? key}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const CircleAvatar(
        minRadius: 30,
        backgroundColor: Colors.red,
      );
    }
    return CircleAvatar(
      minRadius: 30,
      backgroundImage: NetworkImage(user!.avatar),
    );
  }
}

class Reject extends StatelessWidget {
  const Reject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      color: Colors.red,
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Refuser',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
