import '../models/project_model.dart';

abstract class IPortfolioLocalDataSource {
  Future<List<ProjectModel>> getProjects();
}

class PortfolioLocalDataSourceImpl implements IPortfolioLocalDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    return const [
      ProjectModel(
        id: '1',
        title: 'Language Learning App',
        description:
            'LMS logic with quiz capabilities. Built with scalability in mind.',
        tags: ['Riverpod', 'Clean Architecture', 'Education'],
        imageUrl: null, // Placeholder or asset path
        link: null,
      ),
      ProjectModel(
        id: '2',
        title: 'AroggyaPath',
        description:
            'Telemedicine app featuring offline capability. Connects patients with doctors remotely.',
        tags: ['Hive', 'REST API', 'Firebase', 'Healthcare'],
        imageUrl: null,
        link: null,
      ),
      ProjectModel(
        id: '3',
        title: 'GetX Showcase',
        description:
            'Advanced UI demo showcasing dependency injection and complex routing.',
        tags: ['GetX', 'UI/UX', 'Dependency Injection'],
        imageUrl: null,
        link: null,
      ),
    ];
  }
}
