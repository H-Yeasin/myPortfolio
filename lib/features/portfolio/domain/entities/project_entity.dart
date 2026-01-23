class ProjectEntity {
  final String id;
  final String title;
  final String description;
  final List<String> tags;
  final String? imageUrl;
  final String? link;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.tags,
    this.imageUrl,
    this.link,
  });
}
