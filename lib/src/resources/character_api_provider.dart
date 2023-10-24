import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../models/characters_model.dart';
import '../models/character_detail_model.dart';

class CharacterApiProvider {
  final Client client = Client();
  final String _baseUrl = "https://rickandmortyapi.com/api";

  Future<CharactersModel> fetchCharacterList(
    int page, [
    String status = '',
    String gender = '',
    String species = '',
  ]) async {
    Response response;
    response = await client.get(Uri.parse(
        "$_baseUrl/character/?page=$page&status=$status&gender=$gender&species=$species"));
    if (response.statusCode == 200) {
      return CharactersModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<CharacterDetailModel> fetchCharacterDetails(int movieId) async {
    final response =
        await client.get(Uri.parse("$_baseUrl/character/$movieId"));

    if (response.statusCode == 200) {
      return CharacterDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
