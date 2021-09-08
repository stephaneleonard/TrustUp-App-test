import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytrustup/cubit/requests_cubit.dart';
import 'package:mytrustup/cubit/selected_type_cubit.dart';

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
              return const Text('test');
            });
      }
      if (state is RequestsError) {
        return Text('error: ${state.message}');
      }
      return const Text('undifined error');
    });
  }
}
