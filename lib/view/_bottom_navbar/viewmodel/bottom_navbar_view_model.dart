import '../../../core/common/viewmodel/common_view_model.dart';

class BottomNavbarViewModel extends BaseViewModel {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
