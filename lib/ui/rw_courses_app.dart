import 'package:flutter/material.dart';
import 'package:second_app_api/constants/index.dart';
import 'package:second_app_api/ui/courses/courses_page.dart';
import 'package:second_app_api/ui/filter/filter_page.dart';

class RwCoursesApp extends StatelessWidget {
  const RwCoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appTitle),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const FilterPage();
                  },
                ));
              },
              icon: const Icon(Icons.filter_list),
            ),
          ],
        ),
        body:  SafeArea(child: CoursesPage()),
      );
  }
}
