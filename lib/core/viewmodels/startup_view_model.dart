import 'package:compound/core/viewmodels/base_model.dart';
import 'package:compound/locator.dart';
import 'package:compound/core/services/authentication_service.dart';
import 'package:compound/core/services/navigation_service.dart';
import 'package:compound/constants/route_names.dart';


class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}