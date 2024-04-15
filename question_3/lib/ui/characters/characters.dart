import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:question_3/constants/endpoints.dart';
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
      throw Exception('Failed to load characters: ${response.statusCode}');
    }
  }

  void _showCharacterDetailsModal(BuildContext context, Result character) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                alignment: Alignment.center,
                child: Text(
                  character.name!,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Species:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      character.species!,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Status:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      character.status!,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  character.image!,
                  height: 200.0,
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: ${snapshot.error}'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      futureCharacters = _fetchCharacters(
                        pageProvider.currentPage!,
                      );
                    });
                  },
                  child: const Text(
                    'Retry',
                  ),
                ),
              ],
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
