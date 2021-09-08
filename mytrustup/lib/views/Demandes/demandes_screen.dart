import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytrustup/cubit/requests_cubit.dart';
import 'package:mytrustup/cubit/requesttypecount_cubit.dart';
import 'package:mytrustup/cubit/selected_type_cubit.dart';
import 'package:mytrustup/views/Demandes/demandes_header.dart';
import 'package:mytrustup/views/Demandes/demandes_list.dart';

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
        BlocProvider<RequestsCubit>(
          create: (BuildContext context) => RequestsCubit(),
        ),
      ],
      child: Column(
        children: const <Widget>[
          RequestCount(),
          Expanded(
            child: RequestListWrapper(),
          )
        ],
      ),
    );
  }
}
