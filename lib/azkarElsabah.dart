
import 'package:flutter/material.dart';

import 'lists.dart';




class AzkarElsabaah extends StatefulWidget {
  AzkarElsabaah({Key key}) : super(key: key);

  _AzkarElsabaahState createState() => _AzkarElsabaahState();
}

class _AzkarElsabaahState extends State<AzkarElsabaah> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: AzkarElsabah.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // number of button in row
          childAspectRatio: 2
      ),

      itemBuilder: (BuildContext context, int index){
        return SingleAzkarElsabah(
          prodzkr: AzkarElsabah[index]['zekr'],
          prodnum: AzkarElsabah[index]['repeat'],
          prodsubtitle: AzkarElsabah[index]['bless'],


        );
      },
    );
  }
}

class SingleAzkarElsabah extends StatelessWidget {
  final prodzkr;
  final prodnum;
  final prodsubtitle;




  SingleAzkarElsabah({
    this.prodzkr,
    this.prodsubtitle,
    this.prodnum,


  });
  int num =100;




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Card(


                elevation: 10,
                child: ListTile(

                  title: Text(prodzkr,
                    style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),
                    textAlign: TextAlign.center,),


                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
class AzkarElsabaahPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor:    Theme.of(context).brightness == Brightness.dark ? Colors.grey[800]: Color(0xFFFFEDE0),

      appBar: AppBar(
        title: Text("اذكار الصباح",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        centerTitle: true,
        elevation: 10,
      ),
      body: AzkarElsabaah(),
    );
  }
}
