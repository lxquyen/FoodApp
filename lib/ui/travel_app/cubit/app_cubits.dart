import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/ui/travel_app/cubit/app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }
}
