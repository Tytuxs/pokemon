import 'package:flutter/material.dart';


class MySearchDelegate extends SearchDelegate {
  late final TabController _tabController;
  MySearchDelegate(this._tabController);

  List<String> searchResults = [
    'test1',
    'test2',
    'test3',
    'Oli',
    'Bulbizarre',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if(query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 64)
      )
    );

    //_tabController.animateTo(_tabController.previousIndex);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
          },
        );
      },
      itemCount: suggestions.length,
    );

  }
}