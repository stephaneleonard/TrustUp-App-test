import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mytrustup/models/request_count.dart';

part 'requesttypecount_state.dart';

class RequesttypecountCubit extends Cubit<RequesttypecountState> {
  RequesttypecountCubit() : super(const RequesttypecountInitial());

  // ignore: avoid_void_async
  void getRequestCount() async {
    try {
      emit(const RequesttypecountLoading());
      final Count count = await fetchRequestCount();
      emit(RequesttypecountLoaded(count));
    } catch (err) {
      emit(
        RequesttypecountError(
          err.toString(),
        ),
      );
    }
  }
}
