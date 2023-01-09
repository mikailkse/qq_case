import 'package:qq_case/core/common/viewmodel/common_view_model.dart';

import '../../../core/init/navigation/navigation_service.dart';
import '../../home/view/home_view.dart';

class SplashViewModel extends BaseViewModel {
  splashNavigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => NavigationService.instance
          .navigateToPageClear(path: HomeView.routeName),
    );

    notifyListeners();
  }
}
