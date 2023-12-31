// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/authentication/authentication_repository_iml.dart';
import 'package:api_base/data/models/authentication/request_token_response.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostCreateRequestTokenUseCase
    implements FutureOutputUseCase<RequestTokenResponse> {
  final AuthenticationRepositoryIml authenticationRepositoryIml;

  PostCreateRequestTokenUseCase({
    required this.authenticationRepositoryIml,
  });

  @override
  Future<RequestTokenResponse> run() {
    return authenticationRepositoryIml.getRequestToken();
  }
}
