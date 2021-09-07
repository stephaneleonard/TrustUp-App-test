import 'package:bloc/bloc.dart';

class SelectedTypeCubit extends Cubit<int> {
  SelectedTypeCubit() : super(0);

  void selectNewType(int newValue) {
    emit(newValue);
  }
}
