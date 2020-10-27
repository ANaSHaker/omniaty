import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Blog/screens/home.dart';
import 'Notes/Note.dart';
import 'Notes/screens/notes_screen.dart';
import 'PRAY/pray.dart';
import 'SEBHA.dart';
import 'Times.dart';
import 'ahades.dart';
import 'azkarElmasaa.dart';
import 'azkarElsabah.dart';
import 'compass/compass.dart';
import 'constants.dart';
import 'story.dart';



Future<void> _launched;

Future<void> _openUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Draweer extends StatefulWidget {
  Draweer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DraweerState createState() => _DraweerState();
}

class _DraweerState extends State<Draweer> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Development', 'Programming'],
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-7620227695009554/4558215623",
        //Change BannerAd adUnitId with Admob ID
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }



  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-7620227695009554~9420154904");
    //Change appId With Admob Id
    _bannerAd = createBannerAd()
      ..load()
      ..show(
          anchorType: AnchorType.bottom,
          horizontalCenterOffset: 0,
          anchorOffset: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: WillPopScope(
          onWillPop: () {
            return  AwesomeDialog(
              context: context,

              headerAnimationLoop: false,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              body: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom:15.0),
                  child: Text("هل تود اغلاق التطبيق",textAlign: TextAlign.center,),
                ),

                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(

                      color: Colors.green,
                      child: Text("نعم"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                    FlatButton(
                      color: Colors.red,
                      child: Text("لا"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            )
                .show();


          },
          child: KFDrawer(

            controller: KFDrawerController(
              initialPage : Sebha(),
              items: [
                KFDrawerItem.initWithPage(
                  text: Text("تتحقق امنياتي بالدعاء", style: TextStyle(color: Colors.white)),
onPressed: () {

                  },

                ),
                KFDrawerItem.initWithPage(
                  text: Text("اذكار الصباح", style: TextStyle(color: Colors.white)),
onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AzkarElsabaahPage()));
                  },

                ),
                KFDrawerItem.initWithPage(
                  text: Text("اذكار المساء", style: TextStyle(color: Colors.white)),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ElmasaPage()));
                    },

                ),
                KFDrawerItem.initWithPage(
                  text: Text("مشاركة امنياتي", style: TextStyle(color: Colors.white)),
onPressed: () {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                  },

                ),
                KFDrawerItem.initWithPage(
                  text: Text("امنياتي التي اتمني تحققها", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Note()));

                  },

                ),
                KFDrawerItem.initWithPage(
                  text: Text("قصص الانبياء", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryPage()));

                  },

                ),
                KFDrawerItem.initWithPage(
                  text: Text("احاديث الرسول", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AhadesPage()));

                  },

                ),
                KFDrawerItem.initWithPage(
                  text: Text("اتجاه القبلة", style: TextStyle(color: Colors.white)),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Compass()));
                    },

                ),
                KFDrawerItem.initWithPage(
                  text: Text("اوقات الصلاة ", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PrayTimes()));

                  },

                ),



              ],
            ),
            header: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                  'assets/logo.png',
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            footer: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(50),
                      child: IconButton(
                          icon: Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          onPressed: () {

                            LaunchReview.launch();
                          }),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(50),
                        child: IconButton(
                            icon: Icon(
                              Icons.share,
                              color: Colors.indigo,
                            ),
                            onPressed: () {

                              Share.share(
                                  "Hey! Check out this app on Playstore. Coupons app for all offers from different places. If you love the app please review the app on playstore and share it with your friends. https://play.google.com/store/apps/details?id=com.thqq.omnyati");
                            })),
                    SizedBox(
                      width: 30,
                    ),


                  ],
                ),
              ),
            ),
            decoration: Theme.of(context).brightness == Brightness.dark
                ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [gradientDarkStart, gradientDarkEnd],
                tileMode: TileMode.repeated,
              ),
            ) : BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [gradientLightStart, gradientLightEnd],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
        )


    );
  }
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}