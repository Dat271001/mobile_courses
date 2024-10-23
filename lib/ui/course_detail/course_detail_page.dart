import 'package:flutter/material.dart';
import 'package:second_app_api/data/index.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBanner(),
          _buildMain(context),
          _buildDetails(context),
          _buildViewCourseBtn(context),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Hero(
      tag: 'cardArtwork-${course.courseId}',
      transitionOnUserGestures: true,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          image: course.artworkUrl != null
              ? DecorationImage(image: NetworkImage(course.artworkUrl!))
              : null,
        ),
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            course.description ?? '',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Domains: ${course.domainsString}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'Level: ${course.difficulty}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            course.contributors ?? '',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold, //w700
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewCourseBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => _launchCourse(course.courseId),
        child: const Text('Xem khoá học'),
      ),
    );
  }

  void _launchCourse(String courseId) {
    launchUrlString('https://raywenderlich.com/$courseId');
    //Khoá học lập trình của Raywenderlich => kodeco.com
    //Trang các khoá học lập trình iOS, Android, Flutter, Swift Server => Mua 500$/năm
    //LaunchMode.inAppWebView => Mở với chế độ trình duyệt nằm trong ứng dụng
    //LaunchMode.externalApplication => Mở link với trình duyệt mặc định của OS
  }
}
