import 'package:flutter/material.dart';
import 'widgets/custom_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  String selectedTab = 'Posts';

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        body: Column(children: 
        [
          // shifted the code to myhomepagestate due to stateful widgets creation
          AppBar(
            shape: custom_appBar(),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 160,
            height: 160,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 4.0),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/pfp.jpeg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'John Doe',
            style: TextStyle(
              color: Color(0xFFD62828),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'John Doe exists. John Doe builds. John Doe innovates. What’s next? Only time will tell...',
              style: TextStyle(
                color: Color(0xFF929292),
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 60),
      
        // Tab buttons: Posts, comments, stats
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            'Posts', 'Comments', 'Stats'].map((tab) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = tab;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      tab, 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: selectedTab == tab ? Colors.red: Colors.black,
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
            ),
            const Divider(thickness: 3,), 
            
            Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: selectedTab == 'Posts' 
                  ? const PostList() 
                  : selectedTab == 'Comments' 
                      ? const CommentsList() 
                      : const StatsView(),
                   ),
                  )


        ],)
    );
  }
}


class PostList extends StatelessWidget {
  const PostList({super.key});

  final List<Map<String, String>> posts = const [
    {
      'title': 'Tech Conference',
    'date': '30 November 2024, 9:00 AM',
      'location': '13th Street, Park Avenue',
      'author': 'John Doe',
      'image': 'https://source.unsplash.com/100x100/?conference,tech'
    },
    {
      'title': 'Leadership Seminar',
      'date': '28 Jan 2025, 2:00 PM',
      'location': '13th Street, Park Avenue',
      'author': 'John Doe',
      'image': 'https://source.unsplash.com/100x100/?leadership,seminar'
    },
    {
      'title': 'Entrepreneurship Summit',
      'date': '15 March 2025, 10:00 AM',
      'location': '13th Street, Park Avenue',
      'author': 'John Doe',
      'image': 'https://source.unsplash.com/100x100/?entrepreneur,business'
    },
  ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(padding: const EdgeInsets.all(10),
    itemCount: posts.length,
    itemBuilder: (context, index) {
      final post = posts[index];
    
    

    return Card(
      elevation: 5,  
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/images/Picture.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width:10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title']!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                   Text(post['date']!, style: TextStyle(color: Colors.grey[700])),
                      Text(post['location']!, style: TextStyle(color: Colors.grey[700])),
                      Text(post['author']!, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    },
    );
  }
}


class CommentsList extends StatelessWidget {
  const CommentsList({super.key});

  final List<Map<String, String>> comments = const [
    {
      'title': 'Flutter Flash',
      'comment': '"Looks like an amazing event!"',
      'date': '30 November 2024, 11:00 PM',
    },
    {
      'title': 'Bob’s annual BBQ',
      'comment': '"Wish I could’ve been there :("',
      'date': '2 August 2024, 10:31 PM',
    },
    {
      'title': 'Networking Lounge',
      'comment': '"Will the event be starting on time?"',
      'date': '25 June 2023, 12:00 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];

        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                    Text(
                    comment['title']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/arrow.svg', width: 17, height: 17),
                        // const SizedBox(height: 5),
                        Text(comment['comment']!, style: const TextStyle(fontStyle: FontStyle.italic)),

                      ],
                    ),  

                    Column(
                      children: [
                        // const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(comment['date']!, style: TextStyle(color: Colors.grey[700])),
                        ),
                      ],
                    ),
              ],


            ),
          ),
        );
      },
    );
  }
}



class StatsView extends StatelessWidget {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
      SizedBox(height: 30),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  Text('19', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red)),
                  Text('Posts', style: TextStyle(fontSize: 18)),
                ],
              ),
              const SizedBox(width: 100),
              Column(
                children: const [
                  Text('32', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange)),
                  Text('Comments', style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ],
      ),
      ],
    );
  }
}
