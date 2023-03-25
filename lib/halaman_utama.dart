import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'detail.dart';

class halamanutama extends StatelessWidget {
  const halamanutama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman utama kisa e"),
      ),

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: listDisease.length,
        itemBuilder: (context, index){
          final Diseases sakit = listDisease[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return halamandetil(sakit : sakit);
              }
              )
              );

            },
            child: Card(
              child: Column(
                children: [
                  AspectRatio(
                    child: Image.network(sakit.imgUrls,
                        fit: BoxFit.cover),
                    aspectRatio: 3/1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(sakit.name),
                  ),
                ],
              ),
            ),
          );

        },
      ),


    );
  }
}
