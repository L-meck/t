import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tss/database/database.dart';
import 'package:tss/simple_appbar.dart';

import 'flexible.dart';

void main() {
  final HttpLink link4 = HttpLink(funda);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link4,
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
          document: gql(money),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          //
          if (result.hasException) {
            // return Text(result.exception.toString());
            return Center(
                child: Column(
              children: const [
                Spacer(),
                Icon(
                  Iconsax.home_wifi,
                  size: 40,
                ),
                Text(
                  'Check Your',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Internet Connection then Restart',
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
          // final sf = stuff[index];
          //TODO: fix length"
          // print(stuff);
          //

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              const SliverAppBar(
                title: MyAppBar(),
                pinned: true,
                expandedHeight: 210.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: MyFlexiableAppBar(),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final damage = stuff[index];
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text('Account No.'),
                          ),
                          DataColumn(
                            label: Text('Customer Name'),
                          ),
                          DataColumn(
                            label: Text('Street'),
                          ),
                          DataColumn(
                            label: Text('Phone Number'),
                          ),
                          DataColumn(
                            label: Text('TSR'),
                          ),
                          DataColumn(
                            label: Text('Low Gas'),
                          ),
                          DataColumn(
                            label: Text('Low Battery'),
                          ),
                          DataColumn(
                            label: Text('Grams Per Day'),
                          ),
                          DataColumn(label: Text('Days Since Last Task')),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(damage['accountNumber'])),
                              DataCell(Text(damage['customerName'])),
                              DataCell(Text(damage['street'])),
                              DataCell(Text(damage['phoneNumber'])),
                              DataCell(Text(damage['tsr'])),
                              DataCell(Text(damage['lowGas'])),
                              DataCell(Text(damage['lowBattery'])),
                              DataCell(Text(damage['gramsPerDay'])),
                              DataCell(Text(damage['daysSinceLastTask'])),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: stuff.length,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Refetch();
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.workspaces_outlined),
      ),
    );
  }
}
