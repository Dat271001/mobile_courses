import 'package:second_app_api/data/index.dart';

abstract class Repository {

  Future<List<Course>> getCourses(int domainFilter);
}
