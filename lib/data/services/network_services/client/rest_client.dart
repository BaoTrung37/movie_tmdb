import 'package:api_base/data/models/models.dart';
import 'package:api_base/data/services/network_services/commons/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrlV3)
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio, {@factoryParam String? baseUrl}) = _RestClient;

  @GET('/authentication/guest_session/new')
  Future<GuestSessionResponse> getGuestSession();

  @GET('/authentication/token/new')
  Future<RequestTokenResponse> getRequestToken();

  @POST('/authentication/session/new')
  Future<SessionResponse> postCreateSession(
    @Body() SessionRequest body,
  );

  @POST('/authentication/token/validate_with_login')
  Future<RequestTokenResponse> postCreateSessionWithLogin(
    @Body() SessionWithLoginRequest body,
  );

  // Start Movie Lists
  @GET('/movie/popular')
  Future<ApiCollectionResponse<MovieResponse>> getPopularMovies({
    @Query('language') String? language,
    @Query('page') int? page,
    @Query('region') String? region,
  });

  @GET('/movie/now_playing')
  Future<ApiCollectionResponse<MovieResponse>> getNowPlayingMovies({
    @Query('language') String? language,
    @Query('page') int? page,
    @Query('region') String? region,
  });
  // End Movie Lists

  // Start movie

  @GET('/movie/{movie_id}')
  Future<MovieResponse> getMovieDetail(
    @Path('movie_id') String movieId,
    @Query('append_to_response') String? appendToResponse,
  );

  // End movie

  @GET('/genre/movie/list')
  Future<GenresResponse> getMovieGenres({
    @Query('language') String? language,
  });

  @GET('/genre/tv/list')
  Future<GenresResponse> getTvGenres({
    @Query('language') String? language,
  });
}
