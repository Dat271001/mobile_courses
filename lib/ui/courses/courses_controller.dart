import 'package:second_app_api/data/index.dart';

class CoursesController {
  CoursesController(this._repository);
  //Sử dụng interface Repository => Giảm sự phụ thuộc vào tầng Repo
  final Repository _repository;

  Future<List<Course>> fetchCourses(int domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}
