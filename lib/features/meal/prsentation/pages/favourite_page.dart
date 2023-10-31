import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/style/colors.dart';
import 'package:meals_app/core/utils/loading_widget.dart';
import 'package:meals_app/core/utils/text.dart';

import '../../../../core/sqflite/sqf.dart';

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
                  child: Card(color: MyColors.LightGrey,
                    elevation: 2,
                    child: Container(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.only(top:15.0),
                        child: ListTile(
                          leading: ClipOval(
                            child: Image.network(
                                "${snapshot.data![index]['image']}"),
                          ),
                          title: txt(MyColors.Black, "${snapshot.data![index]['name']}",
                              17, FontWeight.w600, FontStyle.normal),
                       /*   trailing: IconButton(onPressed: () async {
                            int response =
                                await sql.deleteData("DELETE FROM meals WHERE id="
                                    " ${snapshot.data![index]['id']}");
                            print(response);
                          },icon: Icon(Icons.delete , color: MyColors.red,),),*/
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
