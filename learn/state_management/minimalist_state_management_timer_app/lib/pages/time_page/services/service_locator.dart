import 'package:get_it/get_it.dart';
import 'package:state_management_minimalists/pages/time_page/time_page_manager.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // state management layer
  getIt.registerLazySingleton<TimePageManager>(() => TimePageManager());

  // service layer
}
