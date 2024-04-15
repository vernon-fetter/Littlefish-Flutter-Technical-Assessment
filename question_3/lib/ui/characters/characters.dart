import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:question_3/models/character_model.dart';
import 'package:question_3/providers/page_provider.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late Future<Character> futureCharacters;
  final String baseUrl = "https://rickandmortyapi.com/api/character";

  @override
  void initState() {
    PageProvider pageProvider = Provider.of(
      context,
      listen: false,
    );
    super.initState();
    futureCharacters = _fetchCharacters(
      pageProvider.currentPage!,
    );
  }

  Future<Character> _fetchCharacters(int page) async {
    PageProvider pageProvider = Provider.of(
      context,
      listen: false,
    );
    final response = await http.get(
      Uri.parse(
        '$baseUrl/?page=${pageProvider.currentPage}',
      ),
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(
        response.body,
      );
      final characters = Character.fromJson(
        responseData,
      );
      pageProvider.pages = characters.info!.pages;
      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }

  void _showCharacterDetailsModal(
    BuildContext context,
    Result character,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                character.name!,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Species: ${character.species.toString()}',
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Text(
                'Status: ${character.status.toString()}',
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _loadNextPage() {
    PageProvider pageProvider = Provider.of(
      context,
      listen: false,
    );
    if (pageProvider.currentPage! < pageProvider.pages!) {
      pageProvider.currentPage = pageProvider.currentPage! + 1;
      setState(() {
        futureCharacters = _fetchCharacters(
          pageProvider.currentPage!,
        );
      });
    }
  }

  void _loadPreviousPage() {
    PageProvider pageProvider = Provider.of(
      context,
      listen: false,
    );
    if (pageProvider.currentPage! > 1) {
      pageProvider.currentPage = pageProvider.currentPage! - 1;
      setState(() {
        futureCharacters = _fetchCharacters(
          pageProvider.currentPage!,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rick and Morty Characters',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[700],
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<Character>(
        future: futureCharacters,
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            pageProvider.pages ??= snapshot.data!.info!.pages;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.results!.length,
                    itemBuilder: (context, index) {
                      Result character = snapshot.data!.results![index];
                      return ListTile(
                        leading: Image.network(
                          character.image!,
                        ),
                        title: Text(character.name!),
                        subtitle: Text(
                          character.species.toString(),
                        ),
                        onTap: () {
                          _showCharacterDetailsModal(
                            context,
                            character,
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _loadPreviousPage,
                      child: const Text(
                        'Previous Page',
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Page ${pageProvider.currentPage} of ${pageProvider.pages}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: _loadNextPage,
                      child: const Text(
                        'Next Page',
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}