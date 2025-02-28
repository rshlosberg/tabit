import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabit/data/data_source/characters_datasource.dart';
import 'package:tabit/data/data_source/characters_rest_client.dart';
import 'package:tabit/data/repository_implementations/characters_repository_impl.dart';
import 'package:tabit/data/transformer/characters_transformer.dart';
import 'package:tabit/domain/repository/characters_repository.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';
import 'package:tabit/domain/usecase/characters_use_case_impl.dart';

final charactersDio = Provider<Dio>(
    (ref) => Dio(),
);

final charactersDataSource = Provider<CharactersDataSource>(
  (ref) => CharactersRestClient(ref.watch(charactersDio)),
);

// final appDatabaseProvider = Provider<AppDatabase>(
//   (ref) => AppDatabase(),
// );

final charactersTransformer =
    Provider<CharactersTransformer>((ref) => CharactersTransformer());

final charactersRepositoryProvider = Provider<CharactersRepository>(
  (ref) => CharactersRepositoryImpl(
    charactersDataSource: ref.watch(charactersDataSource),
    // appDatabase: ref.watch(appDatabaseProvider),
    transformer: ref.watch(charactersTransformer),
  ),
);

final charactersUseCaseProvider = Provider<CharactersUseCase>(
  (ref) => CharactersUseCaseImpl(
    charactersRepository: ref.watch(charactersRepositoryProvider),
  ),
);
