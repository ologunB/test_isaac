import 'package:flagmodeapp12/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;

  Message({required this.sender, required this.time, required this.text});
}

List<User> allUsers = [
  User(id: 0, name: 'James', image: 'assets/images/james.png'),
  User(id: 1, name: 'Jane', image: 'assets/images/jane.png'),
  User(id: 2, name: 'Kane', image: 'assets/images/kane.png'),
  User(id: 3, name: 'Peter', image: 'assets/images/peter.png'),
  User(id: 4, name: 'Micheal', image: 'assets/images/micheal.png'),
  User(id: 5, name: 'White', image: 'assets/images/white.png'),
];

List<Message> chats = [
  Message(
    time: 'Yesterday',
    text: 'are you good there?',
    sender: User(id: 0, name: 'James', image: 'assets/images/james.png'),
  ),
];

List<String> allGroups = [
  'assets/images/james.png',
  'assets/images/jane.png',
  'assets/images/kane.png',
  'assets/images/peter.png',
  'assets/images/micheal.png',
  'assets/images/white.png'
];
