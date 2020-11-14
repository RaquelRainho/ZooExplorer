import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:background_app_bar/background_app_bar.dart';
import 'package:zooexplorer/habitats/gallery.dart';
import 'package:zooexplorer/habitats/info.dart';

class HabitatInfo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.green,
      ),
      home: HabitatInfoPage(),
    );
  }
}

class HabitatInfoPage extends StatefulWidget {
  HabitatInfoPage({Key key}) : super(key: key);

  @override
  _HabitatInfoState createState() => _HabitatInfoState();
}

class _HabitatInfoState extends State<HabitatInfoPage> with SingleTickerProviderStateMixin{
ScrollController _controller;
  TabController _tabController;
  
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose(){
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Color clr = Colors.black.withOpacity(0.0);
  ImageFilter fltr = ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
  BackdropFilter bckDropFilter = BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.0),
                                      ),
                                  ),
                              );
  _scrollListener() {
  if (_controller.offset >= 150.0 && 
    !_controller.position.outOfRange) {
    setState(() {
      bckDropFilter = BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                      ),
                                  ),
                              );
      clr = Colors.black.withOpacity(0.0);
      fltr = ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
    });
    }
    if (_controller.offset >= _controller.position.minScrollExtent && _controller.offset < 150.0 &&
    !_controller.position.outOfRange) {
      setState(() {
        bckDropFilter = BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.0),
                                      ),
                                  ),
                              );
      clr = Colors.black.withOpacity(0.0);
      fltr = ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Image.asset(
                  'assets/logo_short2.png',
                    fit: BoxFit.contain,
                    height: 48,
                ),
                Container(
                    padding: const EdgeInsets.all(8.0), child: Text('Zoo Explorer'))
              ],
            ),
          backgroundColor: Colors.green[900],
          centerTitle: true,
        ),
        body: NestedScrollView(
          controller: _controller,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled){
            return <Widget>[
              SliverAppBar(
                  expandedHeight: 200.0,
                  pinned: true,
                  floating: false,
                  snap: false,
                  flexibleSpace: BackgroundFlexibleSpaceBar(
                        title: Text( "Habitat 01" ),
                        centerTitle: true,
                        titlePadding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                        background: ClipRect(
                            child: Container(
                                child: bckDropFilter,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/lion.jpg",
                                        ),
                                        fit: BoxFit.fitWidth
                          )
                        ),
                      ),
                    ),
                  ),
                ),
              SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.teal[900],
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.info)),
                        Tab(icon: Icon(Icons.photo_rounded)),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
            ];
          },
          body: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Center(child: InfoPage(),),
                    Center(child: GalleryPage()),
                  ],
                ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}