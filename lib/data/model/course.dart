import 'package:second_app_api/data/index.dart';

class Course {
  final String courseId;
  final String name;
  final String? description;
  final String? artworkUrl;
  final String? difficulty;
  final String? contributors;
  final List<Domain> domains;

  Course(
      this.courseId,
      this.name, {
        this.description,
        this.artworkUrl,
        this.difficulty,
        this.contributors,
        this.domains = const [],
      });

  String get domainsString => domains.map((e) => e.name).join(', ');

  Course.fromJson(Map<String, dynamic> json)
      : courseId = json['id'],
        name = json['attributes']['name'],
        description = json['attributes']['description'],
        artworkUrl = json['attributes']['card_artwork_url'],
        difficulty = json['attributes']['difficulty'],
        contributors = json['attributes']['contributor_string'],
        domains = [] {
    final domainData =
    json['relationships']['domains']['data'] as List<dynamic>;
    for (var e in domainData) {
      final domain = Domain.getDomain(e['id']);
      domains.add(domain);
    }
  }

  @override
  String toString() {
    return name;
  }
}
