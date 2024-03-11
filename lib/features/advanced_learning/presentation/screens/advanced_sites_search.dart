// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';

class Advanced_Sites_Search extends StatefulWidget {
  const Advanced_Sites_Search({super.key});

  @override
  State<Advanced_Sites_Search> createState() => _Advanced_Sites_SearchState();
}

class _Advanced_Sites_SearchState extends State<Advanced_Sites_Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('JSON Example'),
        ),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/json/sites.json'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            if (snapshot.hasData) {
              var showData = json.decode(snapshot.data!);
              return ListView.builder(
                  // itemCount: showData['knowing-Allah']['Audios']['Audio'].length,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return buildTile(showData['knowing-Allah']['Audios']['Audio'][index].keys);
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  buildTile(obj) {
    return ListTile(
      title: Text('$obj'),
      subtitle: const Text('نننن}'),
      leading: CircleAvatar(
        backgroundColor: Colors.indigo[400],
        child: const Icon(Icons.money),
      ),
    );
  }
}
