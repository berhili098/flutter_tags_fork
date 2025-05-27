import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tags_fork/flutter_tags_fork.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tags Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MyHomePage(title: 'Flutter Tags'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;

  final List<String> _list = [
    '0',
    'SDK',
    'plugin updates',
    'Facebook',
    '哔了狗了QP又不够了',
    'Kirchhoff',
    'Italy',
    'France',
    'Spain',
    '美',
    'Dart',
    'SDK',
    'Foo',
    'Select',
    'lorem ip',
    '9',
    'Star',
    'Flutter Selectable Tags',
    '1',
    'Hubble',
    '2',
    'Input flutter tags',
    'A B C',
    '8',
    'Android Studio developer',
    'welcome to the jungle',
    'Gauss',
    '美术',
    '互联网',
    '炫舞时代',
    '篝火营地',
  ];

  bool _symmetry = false;
  bool _removeButton = true;
  bool _singleItem = true;
  bool _startDirection = false;
  bool _horizontalScroll = true;
  bool _withSuggesttions = false;
  int _count = 0;
  int _column = 0;
  double _fontSize = 14;

  String _itemCombine = 'withTextBefore';

  final String _onPressed = '';

  final List<IconData> _icon = [Icons.home, Icons.language, Icons.headset];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollViewController = ScrollController();

    _items = _list.toList();
  }

  late List<String> _items;

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  @override
  Widget build(BuildContext context) {
    //List<Item> lst = _tagStateKey.currentState?.getAllItem; lst.forEach((f) => print(f.title));
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text("flutter tags"),
              centerTitle: true,
              pinned: true,
              expandedHeight: 0,
              floating: true,
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                isScrollable: false,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: const TextStyle(fontSize: 18.0),
                tabs: const [
                  Tab(text: "Demo 1"),
                  Tab(text: "Demo 2"),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                            width: 0.5,
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: ExpansionTile(
                        title: const Text("Settings"),
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _removeButton,
                                      onChanged: (a) {
                                        setState(() {
                                          _removeButton = !_removeButton;
                                        });
                                      },
                                    ),
                                    const Text('Remove Button'),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    _removeButton = !_removeButton;
                                  });
                                },
                              ),
                              const Padding(padding: EdgeInsets.all(5)),
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _symmetry,
                                      onChanged: (a) {
                                        setState(() {
                                          _symmetry = !_symmetry;
                                        });
                                      },
                                    ),
                                    const Text('Symmetry'),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    _symmetry = !_symmetry;
                                  });
                                },
                              ),
                              const Padding(padding: EdgeInsets.all(5)),
                              DropdownButton<int>(
                                hint: _column == 0
                                    ? const Text("Not set")
                                    : Text(_column.toString()),
                                items: _buildItems(),
                                onChanged: (a) {
                                  setState(() {
                                    _column = a!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _horizontalScroll,
                                      onChanged: (a) {
                                        setState(() {
                                          _horizontalScroll =
                                              !_horizontalScroll;
                                        });
                                      },
                                    ),
                                    const Text('Horizontal scroll'),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    _horizontalScroll = !_horizontalScroll;
                                  });
                                },
                              ),
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _singleItem,
                                      onChanged: (a) {
                                        setState(() {
                                          _singleItem = !_singleItem;
                                        });
                                      },
                                    ),
                                    const Text('Single Item'),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    _singleItem = !_singleItem;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              const Text('Font Size'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Slider(
                                    value: _fontSize,
                                    min: 6,
                                    max: 30,
                                    onChanged: (a) {
                                      setState(() {
                                        _fontSize = (a.round()).toDouble();
                                      });
                                    },
                                  ),
                                  Text(_fontSize.toString()),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    //color: Colors.blueGrey,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      //color: Colors.white,
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          _count++;
                                          _items.add(_count.toString());
                                          //_items.removeAt(3); _items.removeAt(10);
                                        });
                                      },
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    //color: Colors.grey,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      //color: Colors.white,
                                      icon: const Icon(Icons.refresh),
                                      onPressed: () {
                                        setState(() {
                                          _items = _list.toList();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    _tags1,
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          const Divider(color: Colors.blueGrey),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(_onPressed),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                            width: 0.5,
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: ExpansionTile(
                        title: const Text("Settings"),
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _withSuggesttions,
                                      onChanged: (a) {
                                        setState(() {
                                          _withSuggesttions =
                                              !_withSuggesttions;
                                        });
                                      },
                                    ),
                                    const Text('Suggestions'),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    _withSuggesttions = !_withSuggesttions;
                                  });
                                },
                              ),
                              const Padding(padding: EdgeInsets.all(20)),
                              DropdownButton<String>(
                                hint: Text(_itemCombine),
                                items: _buildItems2(),
                                onChanged: (val) {
                                  setState(() {
                                    _itemCombine = val!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _horizontalScroll,
                                      onChanged: (a) {
                                        setState(() {
                                          _horizontalScroll =
                                              !_horizontalScroll;
                                        });
                                      },
                                    ),
                                    const Text('Horizontal scroll'),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    _horizontalScroll = !_horizontalScroll;
                                  });
                                },
                              ),
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: _startDirection,
                                      onChanged: (a) {
                                        setState(() {
                                          _startDirection = !_startDirection;
                                        });
                                      },
                                    ),
                                    const Text('Start Direction'),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    _startDirection = !_startDirection;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              const Text('Font Size'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Slider(
                                    value: _fontSize,
                                    min: 6,
                                    max: 30,
                                    onChanged: (a) {
                                      setState(() {
                                        _fontSize = (a.round()).toDouble();
                                      });
                                    },
                                  ),
                                  Text(_fontSize.toString()),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    _tags2,
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          const Divider(color: Colors.blueGrey),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(_onPressed),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _tags1 {
    return Tags(
      key: _tagStateKey,
      symmetry: _symmetry,
      columns: _column,
      horizontalScroll: _horizontalScroll,
      //verticalDirection: VerticalDirection.up, textDirection: TextDirection.rtl,
      heightHorizontalScroll: 60 * (_fontSize / 14),
      itemCount: _items.length,
      itemBuilder: (index) {
        final item = _items[index];

        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: item,
          pressEnabled: true,
          activeColor: Colors.blueGrey[600] ?? Colors.red,
          singleItem: _singleItem,
          splashColor: Colors.green,
          combine: ItemTagsCombine.withTextBefore,
          image: (index > 0 && index < 5)
              ? ItemTagsImage(
                  //image: AssetImage("img/p$index.jpg"),
                  child: Image.network(
                    "http://www.clipartpanda.com/clipart_images/user-66327738/download",
                    width: 16 * _fontSize / 14,
                    height: 16 * _fontSize / 14,
                  ),
                )
              : (1 == 1
                    ? ItemTagsImage(
                        image: const NetworkImage(
                          "https://d32ogoqmya1dw8.cloudfront.net/images/serc/empty_user_icon_256.v2.png",
                        ),
                      )
                    : null),
          icon: (item == '0' || item == '1' || item == '2')
              ? ItemTagsIcon(icon: _icon[int.parse(item)])
              : null,
          removeButton: _removeButton
              ? ItemTagsRemoveButton(
                  onRemoved: () {
                    setState(() {
                      _items.removeAt(index);
                    });
                    return true;
                  },
                )
              : null,
          textScaler: TextScaler.linear(
            utf8.encode(item.substring(0, 1)).length > 2 ? 0.8 : 1,
          ),
          textStyle: TextStyle(fontSize: _fontSize),
          onPressed: (item) => debugPrint(item.title),
        );
      },
    );
  }

  // Position for popup menu
  Offset? _tapPosition;

  Widget get _tags2 {
    //popup Menu
    final RenderBox? overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;

    ItemTagsCombine combine = ItemTagsCombine.onlyText;

    switch (_itemCombine) {
      case 'onlyText':
        combine = ItemTagsCombine.onlyText;
        break;
      case 'onlyIcon':
        combine = ItemTagsCombine.onlyIcon;
        break;
      case 'onlyImage':
        combine = ItemTagsCombine.onlyImage;
        break;
      case 'imageOrIconOrText':
        combine = ItemTagsCombine.imageOrIconOrText;
        break;
      case 'withTextAfter':
        combine = ItemTagsCombine.withTextAfter;
        break;
      case 'withTextBefore':
        combine = ItemTagsCombine.withTextBefore;
        break;
    }

    return Tags(
      key: const Key("2"),
      symmetry: _symmetry,
      columns: _column,
      horizontalScroll: _horizontalScroll,
      verticalDirection: _startDirection
          ? VerticalDirection.up
          : VerticalDirection.down,
      textDirection: _startDirection ? TextDirection.rtl : TextDirection.ltr,
      heightHorizontalScroll: 60 * (_fontSize / 14),
      textField: _textField,
      itemCount: _items.length,
      itemBuilder: (index) {
        final item = _items[index];

        return GestureDetector(
          child: ItemTags(
            key: Key(index.toString()),
            index: index,
            title: item,
            pressEnabled: false,
            activeColor: Colors.green.shade400,
            combine: combine,
            image: index > 0 && index < 5
                ? ItemTagsImage(image: AssetImage("img/p$index.jpg"))
                : (1 == 1
                      ? ItemTagsImage(
                          image: NetworkImage(
                            "https://image.flaticon.com/icons/png/512/44/44948.png",
                          ),
                        )
                      : null),
            icon: (item == '0' || item == '1' || item == '2')
                ? ItemTagsIcon(icon: _icon[int.parse(item)])
                : null,
            removeButton: ItemTagsRemoveButton(
              backgroundColor: Colors.green[900],
              onRemoved: () {
                setState(() {
                  _items.removeAt(index);
                });
                return true;
              },
            ),
            textScaler: TextScaler.linear(
              (utf8.encode(item.substring(0, 1)).length > 2 ? 0.8 : 1),
            ),
            textStyle: TextStyle(fontSize: _fontSize),
          ),
          onTapDown: (details) => _tapPosition = details.globalPosition,
          onLongPress: () {
            showMenu(
              //semanticLabel: item,
              items: <PopupMenuEntry>[
                PopupMenuItem(
                  enabled: false,
                  child: Text(
                    item,
                    style: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.content_copy),
                      Text("Copy text"),
                    ],
                  ),
                ),
              ],
              context: context,
              position: RelativeRect.fromRect(
                _tapPosition! & const Size(40, 40),
                Offset.zero & (overlay?.size ?? Size(0, 0)),
              ), // & RelativeRect.fromLTRB(65.0, 40.0, 0.0, 0.0),
            ).then((value) {
              if (value == 1) Clipboard.setData(ClipboardData(text: item));
            });
          },
        );
      },
    );
  }

  TagsTextField get _textField {
    return TagsTextField(
      autofocus: false,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      textStyle: TextStyle(
        fontSize: _fontSize,
        //height: 1
      ),
      enabled: true,
      constraintSuggestion: true,
      suggestions: _withSuggesttions
          ? [
              "One",
              "two",
              "android",
              "Dart",
              "flutter",
              "test",
              "tests",
              "androids",
              "androidsaaa",
              "Test",
              "suggest",
              "suggestions",
              "互联网",
              "last",
              "lest",
              "炫舞时代",
            ]
          : [],
      onSubmitted: (String str) {
        setState(() {
          _items.add(str);
        });
      },
    );
  }

  List<DropdownMenuItem<int>> _buildItems() {
    List<DropdownMenuItem<int>> list = [];

    int count = 19;

    list.add(const DropdownMenuItem<int>(value: 0, child: Text("Not set")));

    for (int i = 1; i < count; i++) {
      list.add(DropdownMenuItem<int>(value: i, child: Text(i.toString())));
    }

    return list;
  }

  List<DropdownMenuItem<String>> _buildItems2() {
    List<DropdownMenuItem<String>> list = [];

    list.add(
      const DropdownMenuItem<String>(
        value: 'onlyText',
        child: Text("onlyText"),
      ),
    );

    list.add(
      const DropdownMenuItem<String>(
        value: 'onlyIcon',
        child: Text("onlyIcon"),
      ),
    );
    list.add(
      const DropdownMenuItem<String>(
        value: 'onlyImage',
        child: Text("onlyImage"),
      ),
    );
    list.add(
      const DropdownMenuItem<String>(
        value: 'imageOrIconOrText',
        child: Text("imageOrIconOrText"),
      ),
    );
    list.add(
      const DropdownMenuItem<String>(
        value: 'withTextBefore',
        child: Text("withTextBefore"),
      ),
    );
    list.add(
      const DropdownMenuItem<String>(
        value: 'withTextAfter',
        child: Text("withTextAfter"),
      ),
    );

    return list;
  }
}
