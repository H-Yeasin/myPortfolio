import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/i_portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';

class PortfolioRepositoryImpl implements IPortfolioRepository {
  final IPortfolioLocalDataSource localDataSource;

  PortfolioRepositoryImpl({required this.localDataSource});

  @override
  Future<List<ProjectEntity>> getProjects() async {
    try {
      final projectModels = await localDataSource.getProjects();
      return projectModels;
    } catch (e) {
      // In a real app, handle exceptions (e.g. map to Failures)
      throw Exception('Failed to load projects: $e');
    }
  }
}
