import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:vibration/vibration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sebha extends KFDrawerContent  {
  @override
  _SebhaState createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int sebha1=0;
  int sebha2=0;
  int sebha3=0;
  int sebha4=0;
  int sebha5=0;
  int sebha6=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:         Theme.of(context).brightness == Brightness.light ? Color(0xFFFFEDE0) : Colors.grey[800],
      appBar: AppBar(
       title: Text("تحقق امنياتي"),
        centerTitle: true,
        leading:   IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: widget.onMenuPressed,),
        actions: [
          IconButton(icon:Icon(
              Theme.of(context).brightness == Brightness.dark ?FontAwesomeIcons.sun :FontAwesomeIcons.moon
          ), onPressed: changeBrightness,)
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 160,
                child: Card(
                  elevation: 20,
                  color:         Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] :  Color(0xFFFFEDE0),

                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("وعنِ ابْنِ عَبَّاسٍ رضِي اللَّه عنْهُما قَال: قالَ رَسُولُ اللَّهِ ﷺ : منْ لَزِم الاسْتِغْفَار، جَعَلَ اللَّه لَهُ مِنْ كُلِّ ضِيقٍ مخْرجًا، ومنْ كُلِّ هَمٍّ فَرجًا، وَرَزَقَهُ مِنْ حيْثُ لاَ يَحْتَسِبُ رواه أبو داود.",textAlign: TextAlign.right,),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [

                  ],
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.yellow,
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color:  Color(0xffD4AF37),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          sebha1++;
                          Vibration.vibrate(duration: 100,);

                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: Icon(Icons.refresh),onPressed: (){
                            setState(() {
                              sebha1 = 0;
                              Vibration.vibrate(duration: 1000,);

                            });
                          },),
                          Text("سبحان الله و بحمده سبحان الله العظيم",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),),
                          Text("عدد التسبيحات \n $sebha1",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.yellow,
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color:  Color(0xffD4AF37),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          sebha2++;
                          Vibration.vibrate(duration: 100,);

                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: Icon(Icons.refresh),onPressed: (){
                            setState(() {
                              sebha2 = 0;
                              Vibration.vibrate(duration: 1000,);

                            });
                          },),
                          Text(" استغفر الله العظيم و اتوب اليه",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),),
                          Text("عدد التسبيحات \n $sebha2",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.yellow,
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color:  Color(0xffD4AF37),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          sebha3++;
                          Vibration.vibrate(duration: 100,);

                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: Icon(Icons.refresh),onPressed: (){
                            setState(() {
                              sebha3 = 0;
                              Vibration.vibrate(duration: 1000,);

                            });
                          },),
                          Text("لا حول ولا قوة الا بالله العلي العظيم",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),),
                          Text("عدد التسبيحات \n $sebha3",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.yellow,
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color:  Color(0xffD4AF37),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          sebha4++;
                          Vibration.vibrate(duration: 100,);

                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: Icon(Icons.refresh),onPressed: (){
                            setState(() {
                              sebha4 = 0;
                              Vibration.vibrate(duration: 1000,);

                            });
                          },),
                          Text("لا اله الا الله",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),),
                          Text("عدد التسبيحات \n $sebha4",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.yellow,
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color:  Color(0xffD4AF37),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          sebha5++;
                          Vibration.vibrate(duration: 100,);

                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: Icon(Icons.refresh),onPressed: (){
                            setState(() {
                              sebha5 = 0;
                              Vibration.vibrate(duration: 1000,);

                            });
                          },),
                          Text("اللهم صلى علي محمد",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),),
                          Text("عدد التسبيحات \n $sebha5",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.yellow,
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color:  Color(0xffD4AF37),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          sebha6++;
                          Vibration.vibrate(duration: 100,);

                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: Icon(Icons.refresh),onPressed: (){
                            setState(() {
                              sebha6 = 0;
                              Vibration.vibrate(duration: 1000,);

                            });
                          },),
                          Text("لا اله الا انت  سبحانك اني كنت من الظالمين",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),),
                          Text("عدد التسبيحات \n $sebha6",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.black),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80,),


          ],
        ),
      ),
    );
  }
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}
