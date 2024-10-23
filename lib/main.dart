import 'package:flutter/material.dart';
import 'package:second_app_api/state/filter_state_container.dart';
import 'package:second_app_api/ui/rw_courses_app.dart';

void main() {
  runApp(
    FilterStateContainer(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green.shade800,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF1D2A78),
            foregroundColor: Colors.white,
          ),
        ),
        home: const RwCoursesApp(),
      ),
    ),
  );
}
