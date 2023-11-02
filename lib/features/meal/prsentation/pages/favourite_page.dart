import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import '../../../../core/sqflite/sqf.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/text.dart';

class FavouritePage extends StatelessWidget {
  SqlDB sql = SqlDB();

  Future<List<Map>> readData() async {
    List<Map> response = await sql.readData("meals");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.White,
      body: FutureBuilder(
        future: readData(),
        builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    color: MyColors.LightGrey,
                    elevation: 2,
                    child: Container(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: ListTile(
                          leading: ClipOval(
                            child: Image.network(
                                "${snapshot.data![index]['image']}"),
                          ),
                          title: txt(
                              MyColors.Black,
                              "${snapshot.data![index]['name']}",
                              17,
                              FontWeight.w600,
                              FontStyle.normal),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
