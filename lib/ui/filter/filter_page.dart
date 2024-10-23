import 'package:flutter/material.dart';
import 'package:second_app_api/constants/index.dart';
import 'package:second_app_api/data/index.dart';
import 'package:second_app_api/state/filter_state_container.dart';
import 'package:second_app_api/ui/filter/filter_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late FilterState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = FilterStateContainer.of(context);
  }

  //Thay đổi giá trị bộ lọc
  void _handleRadioValueChange(int? value) {
    state.updateFilterValue(value ?? Constants.allFilter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.filter),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: Domain.filters.map(
              (e) {
            return FilterWidget(
              value: e.value,
              text: e.name,
              groupValue: state.filterValue,
              onChanged: _handleRadioValueChange,
            );
          },
        ).toList(),
        // children: [
        //   FilterWidget(
        //     value: Constants.iosFilter,
        //     text: Strings.iOS,
        //     groupValue: _filterValue,
        //     onChanged: _handleRadioValueChange,
        //   ),
        //   FilterWidget(
        //     value: Constants.androidFilter,
        //     text: Strings.android,
        //     groupValue: _filterValue,
        //     onChanged: _handleRadioValueChange,
        //   ),
        //   FilterWidget(
        //     value: Constants.sssFilter,
        //     text: Strings.sss,
        //     groupValue: _filterValue,
        //     onChanged: _handleRadioValueChange,
        //   ),
        //   FilterWidget(
        //     value: Constants.unityFilter,
        //     text: Strings.unity,
        //     groupValue: _filterValue,
        //     onChanged: _handleRadioValueChange,
        //   ),
        //   FilterWidget(
        //     value: Constants.macOSFilter,
        //     text: Strings.macOS,
        //     groupValue: _filterValue,
        //     onChanged: _handleRadioValueChange,
        //   ),
        //   FilterWidget(
        //     value: Constants.allFilter,
        //     text: Strings.all,
        //     groupValue: _filterValue,
        //     onChanged: _handleRadioValueChange,
        //   ),
        // ],
      ),
    );
  }
}
