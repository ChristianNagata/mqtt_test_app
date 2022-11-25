import 'package:get_it/get_it.dart';
import 'package:mttq_app/layers/data/datasources/toqui_datasource/toqui_datasouce_impl.dart';
import 'package:mttq_app/layers/data/datasources/toqui_datasource/toqui_datasource.dart';
import 'package:mttq_app/layers/data/repositories/toqui_repository_impl.dart';
import 'package:mttq_app/layers/domain/repositories/toqui_repository.dart';
import 'package:mttq_app/layers/presentation/controllers/mqtt_notifier.dart';
import '../../layers/presentation/controllers/toqui_notifier.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.I;

    //
    getIt.registerLazySingleton<ToquiDatasource>(() => ToquiDatasourceImpl());
    //
    getIt.registerLazySingleton<ToquiRepository>(
        () => ToquiRepositoryImpl(getIt()));
    //
    getIt.registerLazySingleton<ToquiNotifier>(() => ToquiNotifier(getIt()));
    getIt.registerSingleton<MqttNotifier>(MqttNotifier());
  }
}
