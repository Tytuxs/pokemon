
import 'package:flutter/material.dart';
import 'package:pokemon/allPokemonTab.dart';
import 'package:pokemon/customList.dart';
import 'package:pokemon/search.dart';

class home extends StatefulWidget {
  const home({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<home> createState() => _home();
}

class _home extends State<home> with TickerProviderStateMixin{
  late TabController _tabController;
  var nbrTab = 3;
  late int status = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: nbrTab);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: DefaultTabController(
        length: nbrTab,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: const Text("Pokemon"),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: status == 0 ? const Icon(Icons.list) : const Icon(Icons.grid_view),
                onPressed: () {
                  setState(() {
                    if (status == 0) {
                      status = 1;
                    } else {
                      status = 0;
                    }
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(
                      _tabController
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {

                },
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(icon: Icon(Icons.auto_awesome_sharp)),
                Tab(icon: Icon(Icons.star_border)),
                Tab(icon: Icon(Icons.perm_identity_outlined)),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/Bulbizarre.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Center(
                  child: CustomList(
                    title: 'Pokedex',
                    status: status,
                  )
                ),
                AllPokemonTab()
              ],
            ),
          ),
        ),
      )
    );
  }
}

