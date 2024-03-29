import 'package:get_it/get_it.dart';

import '../data/local/secure_key_dao.dart';
import '../data/remote/base_service.dart';
import '../extensions/extension.dart';
import '../modules/modules.dart';
import 'dao_storage.dart';

final getIt = GetIt.instance;

class Injector {
  const Injector();

  static Future<void> create() async {
    const injector = Injector();
    final listDaoLocal = <DaoLocalStorage>[];
    getIt.registerSingleton<List<DaoLocalStorage>>(listDaoLocal);
    injector.onStartRegister();
    await injector.onStartInitLocalStorage();
  }

  Future<void> onStartInitLocalStorage() async {
    final result = getIt.get<List<DaoLocalStorage>>();
    for (final storage in result) {
      await storage.onFirstRegisterLocalStorage();
    }
  }

  void onStartRegister() {
    _onRegisterService();
    _onRegisterCache();
    _onRegisterRepository();
    _onBusinnessLogic();
  }

  void _onRegisterService() {
    getIt.registerLazySingleton<BaseService>(() => BaseService.create());
  }

  void _onRegisterRepository() {
    // Register repository here
  }

  void _onRegisterCache() {
    getIt.onRegisterLocalStorage<SecureKeyDao>(() => SecureKeyDao.create());
  }

  void _onBusinnessLogic() {
    getIt.registerLazySingleton(() => TestCubit.create());
  }
}
