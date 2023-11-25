import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kuki/Screen/TabNavigator.dart';
import 'package:line_icons/line_icons.dart';

class App extends StatefulWidget {
  final String page;
  final int index;
  final String? category;
  final String? name;
  final List<String>? productDetail;
  const App(
      {Key? key,
      required this.page,
      required this.index,
      this.category,
      this.name,
      this.productDetail})
      : super(key: key);
  @override
  _App createState() => new _App();
}

class _App extends State<App> {
  String? _categoryType;
  String? _categoryName;
  List<String>? _productDetail;
  String _currentPage = "Home";
  List<String> pageKeys = ["Home", "ProductTypes", "About"];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Home": GlobalKey<NavigatorState>(),
    "ProductTypes": GlobalKey<NavigatorState>(),
    "About": GlobalKey<NavigatorState>(),
    "ProductList": GlobalKey<NavigatorState>(),
    "ProductBrand": GlobalKey<NavigatorState>(),
    "DetailProduct": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0; //New

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    print("product detail ${widget.productDetail}");
    super.initState();
    _currentPage = widget.page;
    _selectedIndex = widget.index;
    _categoryType = widget.category;
    _categoryName = widget.name;
    _productDetail = widget.productDetail;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
          if (isFirstRouteInCurrentTab) {
            if (_currentPage != "Home") {
              _selectTab("Home", 1);

              return false;
            }
          }
          // let system handle back button if we're on the first route
          return isFirstRouteInCurrentTab;
        },
        child: Scaffold(
          extendBody: true,
          body: Stack(
            children: <Widget>[
              _buildOffStageNavigator("Home"),
              _buildOffStageNavigator("ProductTypes"),
              _buildOffStageNavigator("About"),
              _buildOffStageNavigator("ProductList"),
              _buildOffStageNavigator("ProductBrand"),
              _buildOffStageNavigator("DetailProduct"),
            ],
          ),
          bottomNavigationBar: Container(
            height: 85,
            decoration: const BoxDecoration(
              color: Color(0xFFFFAF91),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 8,
                ),
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.black26,
                  color: Colors.white,
                  tabs: const [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: LineIcons.list,
                      text: 'Product Types',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'About',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    _selectTab(pageKeys[index], index);
                  },
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildOffStageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
        productCategoryType: _categoryType,
        productCategoryName: _categoryName,
        productDetail: _productDetail,
      ),
    );
  }
}
