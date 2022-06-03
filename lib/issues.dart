import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tss/database/database.dart';

class Issues extends StatelessWidget {
  Issues({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
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
                backgroundColor: Colors.yellow,
              ),
            );
          }
          final damage = result.data?['customers'];
          String data = damage['incentive'];
          var splitD = data.split(',');
          // print(splitD);

          //
          // return ListView.builder(
          //   itemCount: damage.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return Text('');
          //   },
          // );
          return const Center(child: Text(''),);
        },
      ),
    );
  }
}
