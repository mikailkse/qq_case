import 'package:qq_case/core/common/viewmodel/common_view_model.dart';
import 'package:qq_case/view/search/view/search_view.dart';

import '../../../core/init/navigation/navigation_service.dart';

class SplashViewModel extends BaseViewModel {
  splashNavigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => NavigationService.instance
          .navigateToPageClear(path: SearchView.routeName),
    );

    notifyListeners();
  }
}
