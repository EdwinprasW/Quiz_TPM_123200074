import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'disease_data.dart';


class halamandetil extends StatefulWidget {
  final Diseases sakit;
  const halamandetil({Key? key, required this.sakit}) : super(key: key);

  @override
  State<halamandetil> createState() => _halamandetilState();
}

class _halamandetilState extends State<halamandetil> {
  bool click = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman detil kisa e'),
          actions: [
          IconButton(
          onPressed: () {
             String text = "Ditambah ke favorite";
                SnackBar snackBar = SnackBar(
                      content: Text(text),
                  );
                if (click == false ) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                setState(() {
                  click = !click;
                });},
                  icon: (click)
                 ? Icon(Icons.favorite)
                   : Icon(Icons.favorite_border),
         ),
          ],),
      body: ListView(
        children: [

          Container(

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Image.network(widget.sakit.imgUrls),

          ),
          Text('Disease Name\n', textAlign: TextAlign.center,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Text(widget.sakit.name + '\n', textAlign: TextAlign.center,  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text('Plant Name\n', textAlign: TextAlign.center,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Text(widget.sakit.plantName + '\n', textAlign: TextAlign.center,  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text('Disease ID\n', textAlign: TextAlign.center,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Text(widget.sakit.id + '\n', textAlign: TextAlign.center,  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text('Symptoms\n' , textAlign: TextAlign.center,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Text(widget.sakit.symptom + '\n', textAlign: TextAlign.center,  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text('Ciri - Ciri\n' , textAlign: TextAlign.center,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          for (var ciri in widget.sakit!.nutshell) Text(ciri + " ", textAlign: TextAlign.center,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                String url = widget.sakit.imgUrls;
                launchURL(url);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.link_outlined,),
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(), //<-- SEE HERE
                padding: EdgeInsets.all(20),
              ),
            ),
          ),

        ],
      ),

    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  void launchURL(String url) async{
    if (await canLaunch(url)){
      await launch(url);
    }else{
      throw 'could not launch $url';
    }
  }
}

