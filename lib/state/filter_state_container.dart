import 'package:flutter/material.dart';
import 'package:second_app_api/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterStateContainer extends StatefulWidget {
  const FilterStateContainer({super.key, required this.child});

  final Widget child;

  @override
  State<FilterStateContainer> createState() => FilterState();

  // Theme.of, MediaQuery.of, Navigator.of
  // Truy ngược lên trên từ vị trí context đến khi nào gặp _FilterInheritedWidget
  // => Nó đang đi tìm tổ tiên (Widget chung) của nó
  // => Nó tìm ra thì nó sẽ trả về trạng thái mà tổ tiên (Widget chung) nó nắm giữ
  // => Trả về _FilterInheritedWidget gần nhất ở trên
  static FilterState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_FilterInheritedWidget>()!
        .state;
  }
}

class FilterState extends State<FilterStateContainer> {
  int filterValue = Constants.allFilter;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadValue();
  }

  //Load lại filterValue từ SharedPerferences
  void _loadValue() async {
    SharedPreferences.getInstance().then(
          (value) {
        _prefs = value;
        setState(() {
          filterValue =
              _prefs.getInt(Constants.filterKey) ?? Constants.allFilter;
        });
      },
    );
  }

  //Cập nhật lại Filter Value
  void updateFilterValue(int value) {
    setState(() {
      _prefs.setInt(Constants.filterKey, value);
      filterValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _FilterInheritedWidget(
      state: this,
      child: widget.child,
    );
  }
}

class _FilterInheritedWidget extends InheritedWidget {
  final FilterState state;

  const _FilterInheritedWidget({
    super.key,
    required this.state,
    required super.child,
  });

  //Hàm này để báo cho Flutter biết
  //có cần phải rebuild lại những widget phụ thuộc InheriedWIdget này ko?
  //=> Mọi sự thay đổi FilterState sẽ rebuild lại tất cả các widget
  //có sử dụng _FilterInheritedWidget
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
