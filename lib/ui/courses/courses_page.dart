import 'package:flutter/material.dart';
import 'package:second_app_api/data/index.dart';
import 'package:second_app_api/state/filter_state_container.dart';
import 'package:second_app_api/ui/course_detail/course_detail_page.dart';

import 'courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController(CoursesRepository());
  late FilterState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = FilterStateContainer.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.fetchCourses(state.filterValue),
      builder: (context, snapshot) {
        final courses = snapshot.data;

        if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }

        if (courses == null ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(

          itemCount: courses.length,
          itemBuilder: (context, index) {

            final course = courses[index];
            return _buildRow(course);
          },

        );
      },
    );
  }

  Widget _buildRow(Course course) {
    return ListTile(
      title: Text(course.name),
      trailing: Hero(
        tag: 'cardArtwork-${course.courseId}',
        transitionOnUserGestures: true,
        child: course.artworkUrl != null
            ? Image.network(course.artworkUrl!)
            : const SizedBox(),
      ),
      subtitle: Text(course.domainsString),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return CourseDetailPage(course: course);
          },
        ));
      },
    );
  }
}
