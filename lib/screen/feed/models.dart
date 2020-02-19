import 'package:meta/meta.dart';
import 'package:timeago/timeago.dart' as timeago;

const placeholderStories = <Story>[Story()];

const nickwu241 =
    User(name: 'nickwu241', imageUrl: 'https://instagram.fmaa8-1.fna.fbcdn.net/v/t51.2885-19/s150x150/73414145_2408574966059648_425197209638666240_n.jpg?_nc_ht=instagram.fmaa8-1.fna.fbcdn.net&_nc_ohc=qeOfkTxDUAUAX--346K&oh=9d1bd61a5e013492e2e8bc08a1500044&oe=5EC2351C');
const grootlover = User(
    name: 'grootlover',
    imageUrl:
        'https://instagram.fmaa8-1.fna.fbcdn.net/v/t51.2885-19/s150x150/73414145_2408574966059648_425197209638666240_n.jpg?_nc_ht=instagram.fmaa8-1.fna.fbcdn.net&_nc_ohc=qeOfkTxDUAUAX--346K&oh=9d1bd61a5e013492e2e8bc08a1500044&oe=5EC2351C',
    stories: placeholderStories);
const starlord = User(
    name: 'starlord',
    imageUrl:
        'https://instagram.fmaa8-1.fna.fbcdn.net/v/t51.2885-19/s150x150/73414145_2408574966059648_425197209638666240_n.jpg?_nc_ht=instagram.fmaa8-1.fna.fbcdn.net&_nc_ohc=qeOfkTxDUAUAX--346K&oh=9d1bd61a5e013492e2e8bc08a1500044&oe=5EC2351C',
    stories: placeholderStories);
const gamora = User(
    name: 'gamora',
    imageUrl:
        'https://instagram.fmaa8-1.fna.fbcdn.net/v/t51.2885-19/s150x150/73414145_2408574966059648_425197209638666240_n.jpg?_nc_ht=instagram.fmaa8-1.fna.fbcdn.net&_nc_ohc=qeOfkTxDUAUAX--346K&oh=9d1bd61a5e013492e2e8bc08a1500044&oe=5EC2351C',
    stories: placeholderStories);
const rocket = User(
    name: 'rocket',
    imageUrl:
        'https://instagram.fmaa8-1.fna.fbcdn.net/v/t51.2885-19/s150x150/73414145_2408574966059648_425197209638666240_n.jpg?_nc_ht=instagram.fmaa8-1.fna.fbcdn.net&_nc_ohc=qeOfkTxDUAUAX--346K&oh=9d1bd61a5e013492e2e8bc08a1500044&oe=5EC2351C',
    stories: placeholderStories);
const nebula = User(
    name: 'nebula',
    imageUrl:
        'https://instagram.fmaa8-1.fna.fbcdn.net/v/t51.2885-19/s150x150/73414145_2408574966059648_425197209638666240_n.jpg?_nc_ht=instagram.fmaa8-1.fna.fbcdn.net&_nc_ohc=qeOfkTxDUAUAX--346K&oh=9d1bd61a5e013492e2e8bc08a1500044&oe=5EC2351C',
    stories: placeholderStories);

const currentUser = nickwu241;

class Post {
  List<String> imageUrls;
  final User user;
  final DateTime postedAt;

  List<Like> likes;
  List<Comment> comments;
  String location;

  String timeAgo() {
    final now = DateTime.now();
    return timeago.format(now.subtract(now.difference(postedAt)));
  }

  bool isLikedBy(User user) {
    return likes.any((like) => like.user.name == user.name);
  }

  void addLikeIfUnlikedFor(User user) {
    if (!isLikedBy(user)) {
      likes.add(Like(user: user));
    }
  }

  void toggleLikeFor(User user) {
    if (isLikedBy(user)) {
      likes.removeWhere((like) => like.user.name == user.name);
    } else {
      addLikeIfUnlikedFor(user);
    }
  }

  Post({
    @required this.imageUrls,
    @required this.user,
    @required this.postedAt,
    @required this.likes,
    @required this.comments,
    this.location,
  });
}

class User {
  final String name;

  final String imageUrl;
  final List<Story> stories;

  const User({
    @required this.name,
    this.imageUrl,
    this.stories = const <Story>[],
  });
}

class Comment {
  String text;
  final User user;
  final DateTime commentedAt;
  List<Like> likes;

  bool isLikedBy(User user) {
    return likes.any((like) => like.user.name == user.name);
  }

  void toggleLikeFor(User user) {
    if (isLikedBy(user)) {
      likes.removeWhere((like) => like.user.name == user.name);
    } else {
      likes.add(Like(user: user));
    }
  }

  Comment({
    @required this.text,
    @required this.user,
    @required this.commentedAt,
    @required this.likes,
  });
}

class Like {
  final User user;

  Like({@required this.user});
}

class Story {
  const Story();
}
