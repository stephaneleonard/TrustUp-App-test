part of 'requests_cubit.dart';

@immutable
abstract class RequestsState {
  const RequestsState();
}

class RequestsInitial extends RequestsState {
  const RequestsInitial();
}

class RequestsLoading extends RequestsState {
  const RequestsLoading();
}

class RequestsLoaded extends RequestsState {
  const RequestsLoaded(this.requests);
  final List<Request> requests;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is RequestsLoaded && o.requests == requests;
  }

  @override
  int get hashCode => requests.hashCode;
}

class RequestsError extends RequestsState {
  const RequestsError(this.message);
  final String message;
}
