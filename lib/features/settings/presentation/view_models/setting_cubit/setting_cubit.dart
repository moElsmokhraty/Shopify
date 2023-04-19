import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/settings/data/repos/settings_repo/settings_repo_impl.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this._settingsRepoImpl) : super(SettingInitial());

  final SettingsRepoImpl _settingsRepoImpl;

  Future<void> logout() async {
    emit(LogOutSuccess());
    var response = await _settingsRepoImpl.logout();
    response.fold((failure) {
      emit(LogOutFailure(failure.errMessage));
    }, (data) {
      if (data.status == false) {
        emit(LogOutFailure(data.message!));
      } else {
        emit(LogOutSuccess());
      }
    });
  }
}
