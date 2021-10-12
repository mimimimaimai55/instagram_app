import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Instagram(),
    );
  }
}

class Instagram extends StatefulWidget {
  @override
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  User _user = User(
    name: 'LANA',
    id: 'Lana342',
    image: 'assets/instagram/profile-1627609241345-8fb41ec24d95image.jpg',
  );

  Post _post = Post(
    body:
        'スワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてくださいスワイプしてみてください',
    imageList: [
      'assets/instagram/jim-flores-dE6c9RZoyL8-unsplash.jpg',
      'assets/posts/mukuko-studio-mU88MlEFcoU-unsplash.jpg',
      'assets/posts/alyssa-strohmann-TS--uNw-JqE-unsplash.jpg'
    ],
    createdAt: DateTime.now().add(
      Duration(
        hours: -20,
      ),
    ),
  );

  PageController _pageController = PageController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/instagram/1024px-Instagram_logo.svg.png',
          height: 50,
        ),
        actions: [
          Icon(Icons.add_box_outlined),
          SizedBox(width: 15),
          Icon(Icons.favorite_border_outlined),
          SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Transform.rotate(
              angle: 31 / 1,
              child: Icon(Icons.send_outlined),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(_user.image),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                ),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.blue,
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'ストーリーズ',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(10, (index) => null)
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(_user.image),
                                ),
                              ),
                              Text(
                                _user.id,
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(_user.image),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _user.id,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _user.name,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.more_horiz_outlined),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 1,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _post.imageList.length,
                itemBuilder: (context, i) {
                  return Image.asset(_post.imageList[i]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Row(
                            children: [
                              Icon(Icons.favorite_border_outlined,size:28,),
                              SizedBox(width: 5),
                              Icon(Icons.mode_comment_outlined,size:28,),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.only(bottom:7.0),
                                child: Transform.rotate(
                                  angle: 31 / 1,
                                  child: Icon(Icons.send_outlined,size:28,),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: _post.imageList
                              .map((e) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 1.5),
                                    child: CircleAvatar(
                                      radius: 3,
                                      backgroundColor:
                                          (_post.imageList.indexOf(e) == currentIndex)
                                              ? Colors.blue
                                              : Colors.grey,
                                    ),
                                  ),).toList(),
                        ),

                        Container(
                          alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Icon(Icons.bookmark_border_outlined)),
                      ],
                    ),
                  ),
                  Text(
                    '${_user.id} ${_post.body}',
                    style: TextStyle(
                        fontSize: 13,
                        // fontWeight: FontWeight.bold
                      ),
                  ),
                  Text(
                    'コメント1件を表示',
                    style: TextStyle(
                        fontSize: 13,
                        color:Colors.grey
                        // fontWeight: FontWeight.bold
                      ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String id;
  final String image;
  User({required this.name, required this.id, required this.image});
}

class Post {
  final List<String> imageList;
  final String body;
  final DateTime createdAt;
  Post({required this.imageList, required this.body, required this.createdAt});
}
