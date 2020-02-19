import 'package:flutter/material.dart';

import 'package:tripme/screen/feed/models.dart';
import 'package:tripme/screen/feed/post_widget.dart';
import 'package:tripme/screen/feed/ui_utils.dart';

class HomeFeedPage extends StatefulWidget {
  final ScrollController scrollController;

  HomeFeedPage({this.scrollController});

  @override
  _HomeFeedPageState createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {
  final _posts = <Post>[
    Post(
      user: grootlover,
      imageUrls: [
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Garudan_Thookam_Participants.jpg/375px-Garudan_Thookam_Participants.jpg',
        'https://upload.wikimedia.org/wikipedia/commons/9/91/Etookam.JPG',
        'https://planmitrip.in/admin/gallery/ezham-min.jpg',
      ],
      likes: [
        Like(user: rocket),
        Like(user: starlord),
        Like(user: gamora),
        Like(user: nickwu241),
      ],
      comments: [
        Comment(
          text: 'Thankyou Yuga for showing the true cultures of \nkerala #YugaApp',
          user: rocket,
          commentedAt: DateTime(2019, 5, 23, 14, 35, 0),
          likes: [Like(user: nickwu241)],
        ),
      ],
      location: 'Ezhamkulam Devi Temple',
      postedAt: DateTime(2019, 5, 23, 12, 35, 0),
    ),
    Post(
      user: nickwu241,
      imageUrls: ['https://d345cba086ha3o.cloudfront.net/wp-content/uploads/2018/01/lflozWibhbcsi-768x432.jpg'],
      likes: [],
      comments: [],
      location: 'The Jatayu Nature park',
      postedAt: DateTime(2019, 5, 21, 6, 0, 0),
    ),
    Post(
      user: nebula,
      imageUrls: ['https://www.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/07/12/Pictures/_eb5daf26-85b7-11e8-a662-45bbb3f001dc.jpg'],
      likes: [Like(user: nickwu241)],
      comments: [],
      location: 'Munnar',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemBuilder: (ctx, i) {
        if (i == 0) {
         i =1;
        }
        return PostWidget(_posts[i - 1]);
      },
      itemCount: _posts.length + 1,
      controller: widget.scrollController,
    );
  }
}

class StoriesBarWidget extends StatelessWidget {
  final _users = <User>[
    currentUser,
    grootlover,
    rocket,
    nebula,
    starlord,
    gamora,
  ];

  void _onUserStoryTap(BuildContext context, int i) {
    final message =
        i == 0 ? 'Add to Your Story' : "View ${_users[i].name}'s Story";
    showSnackbar(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.0,
      child: Text('data')
    );
  }
}
