// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostLoginWithUsernameAndPasswordUseCase extends FutureUseCase<
    PostLoginWithUsernameAndPasswordInput, RequestTokenResponse> {
  final AuthenticationRepositoryIml authenticationRepositoryIml;

  PostLoginWithUsernameAndPasswordUseCase({
    required this.authenticationRepositoryIml,
  });

  @override
  Future<RequestTokenResponse> run(
      PostLoginWithUsernameAndPasswordInput input) {
    return authenticationRepositoryIml.postCreateSessionWithLogin(input);
  }
}

class PostLoginWithUsernameAndPasswordInput {
  final String username;
  final String password;
  final String requestToken;
  PostLoginWithUsernameAndPasswordInput({
    required this.username,
    required this.password,
    required this.requestToken,
  });
}
