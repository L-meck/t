import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tss/simple_appbar.dart';

import 'database/st/funda.dart';
import 'flexible.dart';

void main() {
  final HttpLink linky = HttpLink(
      funda);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: linky,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    ),
  );

  var app = GraphQLProvider(
    client: client,
    child: const MyApp(),
  );
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TSS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TSS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double barHeight = 66.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text(widget.title),
      // ),
      body: Query(
        options: QueryOptions(
          document: gql(funda),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          //
          if (result.hasException) {
            // return Text(result.exception.toString());
            return Center(
                child: Column(
              children: const [
                Spacer(),
                Text(
                  'Kindly Check Your',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Internet Connection',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
              ],
            ));
          }
          //
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          }

          final stuff = result.data?['customers'];
          // print(roses);

          //

          return const CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                title: MyAppBar(),
                pinned: true,
                expandedHeight: 210.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: MyFlexiableAppBar(),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Refresh',
        child: const Icon(Icons.workspaces_outlined),
      ),
    );
  }
}
