import '../entities/project_entity.dart';

abstract class IPortfolioRepository {
  Future<List<ProjectEntity>> getProjects();
}
