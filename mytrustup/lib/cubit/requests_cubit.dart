import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mytrustup/models/request.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit() : super(const RequestsInitial());

  // ignore: avoid_void_async
  void getRequests(String? type) async {
    try {
      emit(const RequestsLoading());
      final List<Request> requests = await fetchRequest(type);
      emit(RequestsLoaded(requests));
    } catch (err) {
      emit(
        RequestsError(
          err.toString(),
        ),
      );
    }
  }
}
