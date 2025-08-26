import 'package:archtech/config/locale/locale.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/core/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<AppLocale> {
  LocaleCubit(super.initialState);
  final CacheHelper _cacheHelper = Injection.instance.cacheHelper;
  void changeLocale(AppLocale locale) => emit(locale);
  Future saveLocale() async {
    await _cacheHelper.saveData(key: 'locale', value: state.code);
  }
}
