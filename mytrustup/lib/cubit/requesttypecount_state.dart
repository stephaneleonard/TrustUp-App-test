part of 'requesttypecount_cubit.dart';

@immutable
abstract class RequesttypecountState {
  const RequesttypecountState();
}

class RequesttypecountInitial extends RequesttypecountState {
  const RequesttypecountInitial();
}

class RequesttypecountLoading extends RequesttypecountState {
  const RequesttypecountLoading();
}

class RequesttypecountLoaded extends RequesttypecountState {
  const RequesttypecountLoaded(this.count);
  final Count count;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is RequesttypecountLoaded && o.count == count;
  }

  @override
  int get hashCode => count.hashCode;
}

class RequesttypecountError extends RequesttypecountState {
  const RequesttypecountError(this.message);
  final String message;
}
