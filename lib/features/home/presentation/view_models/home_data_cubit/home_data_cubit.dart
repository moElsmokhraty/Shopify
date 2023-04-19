import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_data_state.dart';

class HomeDataCubit extends Cubit<HomeDataState> {
  HomeDataCubit() : super(HomeDataInitial());
}
