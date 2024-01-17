// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/domain/use_cases/movie/get_popular_movie_list_use_case.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TrendingMovieCubit extends Cubit<MovieState> {
  TrendingMovieCubit(
    this._getPopularMovieListUseCase,
  ) : super(const MovieState());

  final GetPopularMovieListUseCase _getPopularMovieListUseCase;

  Future<void> fetchData() async {
    try {
      emit(state.copyWith(status: AppStatus.inProgress));
      final response = await _getPopularMovieListUseCase.run(
        GetPopularMovieListInput(page: 1),
      );

      final moviesList = response;

      emit(state.copyWith(
        movies: moviesList,
        status: AppStatus.success,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: e.appError,
      ));
    }
  }
}
