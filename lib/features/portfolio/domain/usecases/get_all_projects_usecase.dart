import '../entities/project_entity.dart';
import '../repositories/i_portfolio_repository.dart';

class GetAllProjectsUseCase {
  final IPortfolioRepository repository;

  GetAllProjectsUseCase(this.repository);

  Future<List<ProjectEntity>> call() async {
    return await repository.getProjects();
  }
}
