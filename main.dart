import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

//=================== 1 =========================
_buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _buildJournalHeaderImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildJournalEntry(),
                Divider(),
                _buildJournalWeather(),
                Divider(),
                _buildJournalTags(),
                Divider(),
                _buildJournalFooterImages(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

_buildJournalFooterImages() {
  Row _buildJournalFooterImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://media.istockphoto.com/id/1319267869/photo/raw-fillet-of-salmon-with-sea-salt-lemon-and-pepper-on-black-stone-background.jpg?s=612x612&w=0&k=20&c=EmuD1Xg6SFhg052R0nn76Lt-_RWKdyam38XPBwaQm94="),
          // backgroundImage: AssetImage('assets/images/salmon.jpg'),
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.squarespace-cdn.com/content/v1/588033e8725e25792a4692c1/1585678782470-FELBB4FHPIRZFKS2YOVR/Asparagus.jpg?format=1000w"),
          // backgroundImage: AssetImage('assets/images/asparagus.jpg'),
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/70746/strawberries-red-fruit-royalty-free-70746.jpeg?cs=srgb&dl=pexels-pixabay-70746.jpg&fm=jpg"),
          // backgroundImage: AssetImage('assets/images/strawberries.jpg'),
          radius: 40.0,
        ),
        SizedBox(
          width: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.cake),
              Icon(Icons.star_border),
              Icon(Icons.music_note),
              //Icon(Icons.movie),
            ],
          ),
        ),
      ],
    );
  }
}

_buildJournalTags() {
  Wrap _buildJournalTags() {
    return Wrap(
      spacing: 8.0,
      children: List.generate(7, (int index) {
        return Chip(
          label: Text(
            'Gift ${index + 1}',
            style: TextStyle(fontSize: 10.0),
          ),
          avatar: Icon(
            Icons.card_giftcard,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }
}

_buildJournalWeather() {
  Row _buildJournalWeather() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.wb_sunny,
              color: Colors.orange,
            ),
          ],
        ),
        SizedBox(
          width: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '81º Clear',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '4500 San Alpho Drive, Dallas, TX United States',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// ================== 3 =========================
Column _buildJournalEntry() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'My Birthday',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        'It’s going to be a great birthday. We are going out for dinner at my favorite place, then watch a movie after we go to the gelateria for ice cream and espresso.',
        style: TextStyle(color: Colors.black54),
      ),
    ],
  );
}

//================== 3 ====================
_buildJournalHeaderImage() {
  Image _buildJournalHeaderImage() {
    // return Image(
    //   image: AssetImage('assets/images/present.jpg'),
    //   fit: BoxFit.cover,
    // );
    return Image.network(
        "https://i.etsystatic.com/15536434/r/il/671d0a/5249694141/il_fullxfull.5249694141_n2cz.jpg",
        fit: BoxFit.cover);
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var title;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        // brightness: Brightness.light,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.cloud_queue), onPressed: () {})
        ],
      ),
      // body: Center(),
      body: _buildBody(),
    );
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: _controller.value * 200, // Animated width
          height: _controller.value * 200, // Animated height
          color: Colors.blue,
        );
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<AnimationController>('_controller', _controller));
  }
}
