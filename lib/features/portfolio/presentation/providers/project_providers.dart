import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/portfolio_local_data_source.dart';
import '../../data/repositories/portfolio_repository_impl.dart';
import '../../domain/repositories/i_portfolio_repository.dart';
import '../../domain/usecases/get_all_projects_usecase.dart';
import '../../domain/entities/project_entity.dart';

// initializing the data source
final portfolioLocalDataSourceProvider = Provider<IPortfolioLocalDataSource>((
  ref,
) {
  return PortfolioLocalDataSourceImpl();
});

// initializing the repository
final portfolioRepositoryProvider = Provider<IPortfolioRepository>((ref) {
  final localDataSource = ref.watch(portfolioLocalDataSourceProvider);
  return PortfolioRepositoryImpl(localDataSource: localDataSource);
});

// initializing the use case
final getAllProjectsUseCaseProvider = Provider<GetAllProjectsUseCase>((ref) {
  final repository = ref.watch(portfolioRepositoryProvider);
  return GetAllProjectsUseCase(repository);
});

// The main provider consumed by the UI
final projectsProvider = FutureProvider<List<ProjectEntity>>((ref) async {
  final getAllProjects = ref.watch(getAllProjectsUseCaseProvider);
  return await getAllProjects();
});
