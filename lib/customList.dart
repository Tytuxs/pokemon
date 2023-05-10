import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:pokemon/constants.dart';

import 'customCard.dart';

@immutable
class CustomList extends StatefulWidget {
  final String title;
  final int status;

  const CustomList({required this.title, Key? key,  this.status = 0}) : super(key: key);

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  late Future<List<Pokemon?>> liste;
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 150,
      repo: JsonCacheInfoRepository(databaseName: 'customCacheKey'),
      fileService: HttpFileService(),
    ),
  );
  final int _currentMovie = 1;

  @override
  void initState() {
    print("initstate");
    super.initState();
    liste = getPokemon();
  }

  Future<List<Pokemon?>> getPokemon() async {
    return await PokeAPI.getObjectList<Pokemon>(1, 5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(widget.title)),
            ],
          ),
        ),
        SizedBox(
          height: 500,
          child: FutureBuilder(
            future: liste,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('No connection');
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                    ),
                  );
                default:
                  if (snapshot.data == null) {
                    return const Text('No data');
                  }

                  if(widget.status == 0) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCard(
                          title: snapshot.data![index]!.name.toString(),
                          height: heightImage,
                          onTab: () {},
                          color: const Color.fromRGBO(108, 115, 255, 1),
                          gradient: const Color.fromRGBO(58, 63, 255, 1),
                          image: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              cacheManager: customCacheManager,
                              key: UniqueKey(),
                              imageUrl: snapshot.data![index]!.sprites!
                                  .frontDefault.toString(),
                              height: heightImage,
                              fit: BoxFit.contain,
                              memCacheHeight: heightImage.toInt(),
                              placeholder: (context, url) {
                                return Container(color: Colors.black12);
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  color: Colors.black12,
                                  child: const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 80
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    );
                  }
                  else {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                      ),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: CustomCard(
                            title: snapshot.data![index]!.name.toString(),
                            height: heightImage,
                            onTab: () {},
                            color: const Color.fromRGBO(108, 115, 255, 1),
                            gradient: const Color.fromRGBO(58, 63, 255, 1),
                            image: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                cacheManager: customCacheManager,
                                key: UniqueKey(),
                                imageUrl: snapshot.data![index]!.sprites!
                                    .frontDefault.toString(),
                                height: heightImage,
                                fit: BoxFit.contain,
                                memCacheHeight: heightImage.toInt(),
                                placeholder: (context, url) {
                                  return Container(color: Colors.black12);
                                },
                                errorWidget: (context, url, error) {
                                  return Container(
                                    color: Colors.black12,
                                    child: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 80
                                    ),
                                  );
                                },
                              ),
                            ),
                        ),
                        );
                      }
                    );
                  }
              }
            },
          ),
        ),
      ],
    );
  }
}
