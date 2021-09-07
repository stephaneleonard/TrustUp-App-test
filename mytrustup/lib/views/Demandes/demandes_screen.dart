import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytrustup/cubit/requesttypecount_cubit.dart';
import 'package:mytrustup/cubit/selected_type_cubit.dart';
import 'package:mytrustup/models/request_count.dart';

class Demandes extends StatelessWidget {
  const Demandes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ignore: always_specify_types
      providers: [
        BlocProvider<SelectedTypeCubit>(
          create: (BuildContext context) => SelectedTypeCubit(),
        ),
        BlocProvider<RequesttypecountCubit>(
          create: (BuildContext context) => RequesttypecountCubit(),
        ),
      ],
      child: Column(
        children: const <Widget>[
          RequestCount(),
        ],
      ),
    );
  }
}

class RequestCount extends StatelessWidget {
  const RequestCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<RequesttypecountCubit>().getRequestCount();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Mes demandes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          BlocBuilder<RequesttypecountCubit, RequesttypecountState>(
              builder: (BuildContext context, RequesttypecountState state) {
            if (state is RequesttypecountInitial) {
              return const Text('initial');
            }
            if (state is RequesttypecountLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RequesttypecountLoaded) {
              return RequestTypeList(
                count: state.count,
              );
            }
            return const Text('error');
          })
        ],
      ),
    );
  }
}

class RequestTypeList extends StatelessWidget {
  const RequestTypeList({required this.count, Key? key}) : super(key: key);

  final Count count;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedTypeCubit, int>(
        builder: (BuildContext context, int selectedType) {
      return SizedBox(
        height: 80,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            RequestTypeTile(
              name: 'Toutes les demandes',
              number: count.all,
              id: 0,
              selected: selectedType == 0,
            ),
            RequestTypeTile(
              name: 'En attente',
              number: count.pending,
              id: 1,
              selected: selectedType == 1,
            ),
            RequestTypeTile(
              name: 'En cours',
              number: count.inProgress,
              id: 2,
              selected: selectedType == 2,
            ),
            RequestTypeTile(
              name: 'Soumis',
              number: count.quoted,
              id: 3,
              selected: selectedType == 3,
            ),
            RequestTypeTile(
              name: 'Décliné',
              number: count.declined,
              id: 4,
              selected: selectedType == 4,
            ),
            RequestTypeTile(
              name: 'Gagné',
              number: count.won,
              id: 5,
              selected: selectedType == 5,
            ),
            RequestTypeTile(
              name: 'Perdu',
              number: count.lost,
              id: 6,
              selected: selectedType == 6,
            ),
          ],
        ),
      );
    });
  }
}

class RequestTypeTile extends StatelessWidget {
  const RequestTypeTile(
      {required this.number,
      required this.name,
      required this.id,
      required this.selected,
      Key? key})
      : super(key: key);

  final String name;
  final int number;
  final int id;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SelectedTypeCubit>().selectNewType(id);
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: selected ? Colors.blue : Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              number.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.blue : Colors.black,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
