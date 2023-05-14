import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/globals/globals.dart';
import 'package:media_booster/views/screen/audio_player.dart';





final assetsAudioPlayer = AssetsAudioPlayer();

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {




  @override

  void initState() {
    super.initState();
    assetsAudioPlayer.open(
        Audio("${Globals.all_Song[Globals.initinalvalue]['song']}"),
      autoStart: false,
    );

  }
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  DefaultTabController(length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal.shade500,
            centerTitle: true,
            title: const Text(
              "Media Player",
            ),
            bottom: const TabBar(

              indicatorColor: Colors.brown,
              indicatorWeight: 8,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
              tabs: [
                Tab(
                  icon: Icon(Icons.audio_file),
                  text: "audio",
                ),
                Tab(
                  icon: Icon(Icons.videocam),
                  text: "vedio",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.separated(
                itemCount: Globals.all_Song.length,
                separatorBuilder: (context,i) => SizedBox(height: 10),
                  itemBuilder: (context,i) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: (){
                        setState(() {
                          Globals.initinalvalue = i;
                          new_song(play: true);
                          Globals.totalsecond = assetsAudioPlayer
                              .current.value!.audio.duration
                              .toString()
                              .split(".")[0];
                          Navigator.of(context).pushNamed('audio_player');
                        });
                      },
                      child: Container(
                        height: height * 0.15,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal.shade300,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Image.asset("${Globals.all_Song[i]['image']}",
                               height: height * 0.1,
                              fit: BoxFit.fitHeight,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: height * 0.09,
                              width: 150,
                              child: Text("\n${Globals.all_Song[i]['name']}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              ),
              // Center(
              //   child: Text("first"),
              // ),
              Center(
                child: Text("second"),
              ),
            ],
          ),
        ),
    );
  }
 }


