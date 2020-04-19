import 'package:compound/core/services/api.dart';
import 'package:compound/core/services/authentication_service.dart';
import 'package:compound/core/services/firestore_service.dart';
import 'package:compound/core/viewmodels/home_model.dart';
import 'package:compound/core/viewmodels/login_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:compound/core/services/navigation_service.dart';
import 'package:compound/core/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => FirestoreService());


  locator.registerFactory(()=>LoginViewModel());
  locator.registerFactory(()=>HomeModel());
  //locator.registerFactory(()=>CommentsModel());
}
