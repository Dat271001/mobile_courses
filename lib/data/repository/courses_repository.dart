import 'dart:convert';
import 'package:second_app_api/constants/index.dart';
import 'package:second_app_api/data/index.dart';
import 'package:http/http.dart' as http;

class CoursesRepository implements Repository {
  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];
    var url = Constants.RW_API;
    if (domainFilter != Constants.allFilter) {
      url += '&filter[domain_ids][]=$domainFilter';
    }

    final uri = Uri.parse(url);

    final response = await http.get(uri);

    final jsonMap = json.decode(response.body) as Map<String, dynamic>;

    final data = jsonMap['data'] as List;

    for (var json in data) {
      final course = Course.fromJson(json);
      courses.add(course);
    }

    return courses;
  }
}
