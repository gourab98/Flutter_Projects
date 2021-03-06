import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const String _theText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae.\n';

const String _image0 =
    'https://images.unsplash.com/photo-1544198365-f5d60b6d8190?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80';
const String _image1 =
    'https://images.unsplash.com/photo-1586099079958-3b7975abb2fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1280&q=80';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Photo Animations",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showlist = true;
  bool _slowAnimations = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _showlist = !_showlist;
                print("$_showlist");
              });
            },
            icon: Icon(Icons.swap_horiz),
          ),
        ],
      ),
      body: _showlist ? ListExample() : GridExample(),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SwitchListTile(
          value: _slowAnimations,
          onChanged: (value) async {
            setState(() => _slowAnimations = value);
            if (_slowAnimations) {
              await Future<void>.delayed(const Duration(milliseconds: 300));
            }
            timeDilation = _slowAnimations ? 8.0 : 1.0;
          },
          title: const Text('Slow animations'),
        ),
      ),
    );
  }
}

class ListExample extends StatelessWidget {
  const ListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.network(
            _image0,
            width: 60.0,
            fit: BoxFit.cover,
          ),
          title: Text('Title $index'),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return DetailScreen(
                  title: 'Title $index',
                  imageUrl: _image0,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class GridExample extends StatelessWidget {
  const GridExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return DetailScreen(
                    title: 'Title $index',
                    imageUrl: _image1,
                  );
                },
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  _image1,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8.0),
                Text("Title $index"),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String title;
  final String imageUrl;

  const DetailScreen({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _largePhoto = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo details"),
      ),
      body: _largePhoto
          ? GestureDetector(
              onTap: () => setState(() => _largePhoto = !_largePhoto),
              child: Image.network(
                widget.imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _largePhoto = !_largePhoto),
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(_theText),
                ],
              ),
            ),
    );
  }
}
