import 'dart:async';
import 'character_api_provider.dart';
import '../models/characters_model.dart';
import '../models/character_detail_model.dart';

class Repository {
  final charactersApiProvider = CharacterApiProvider();

  Future<CharactersModel> fetchAllCharacters(
    int page, [
    String status = '',
    String gender = '',
    String species = '',
  ]) =>
      charactersApiProvider.fetchCharacterList(page, status, gender, species);

  Future<CharacterDetailModel> fetchCharacterDetails(int movieId) =>
      charactersApiProvider.fetchCharacterDetails(movieId);
}
