class Joke {
  final int jokeId;
  final String title;
  final String describe;
  final String content;
  bool? isFunny;

  Joke(
      {required this.jokeId,
      required this.title,
      required this.describe,
      required this.content,
      this.isFunny});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
        jokeId: json['jokeId'] ?? 0,
        title: json['title'] ?? '',
        describe: json['describe'] ?? '',
        content: json['content'] ?? '',
        isFunny: json['isFunny']);
  }

  Map<String, dynamic> toJson() {
    return {
      'jokeId': jokeId,
      'title': title,
      'describe': describe,
      'content': content,
      'isFunny': isFunny
    };
  }
}

List<Joke> jokes = [
  Joke(
      jokeId: 0,
      title: 'A joke a day keeps the doctor away',
      describe: 'If you joke wrong way, your teeth have to pay. (Serious)',
      content:
          'A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults anda made babies, and so on." The child then went to his mother, asked her the same question and told him, "We were monkeys then we evolved to become like we are now." The child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."'),
  Joke(
      jokeId: 1,
      title: 'Memorable Journey',
      describe:
          'Why did the scarecrow win an award? Because he was outstanding in his field.',
      content:
          'During a trip, two close friends pass through a remote countryside area. They come across a sign erected at the end of a dead-end road. The sign reads: "Dĩ vãng trước" (The past is past). One of the friends asks the locals about the meaning of the sign. The locals just laugh and say, "Its a reminder for everyone that the past is gone, theres no road ahead.'),
  Joke(
      jokeId: 2,
      title: 'Unfortunate Encounter with the God of Luck',
      describe:
          'I told my wife she was drawing her eyebrows too high. She looked surprised.',
      content:
          'A man walks into a cosmetics shop with a very gloomy face. The shopkeeper curiously asks him, "Why are you so sad?" He replies, "I bought a new bottle of perfume, hoping to encounter good luck, but instead, everything turned worse." The shopkeeper laughs and says, "Perhaps you should use a different perfume. This one is "Thần May Mắn" (God of Luck), not "Sự Kiện May Mắn" (Fortunate Event)!'),
  Joke(
      jokeId: 3,
      title: 'Unexpected Encounter',
      describe:
          'Why do not skeletons fight each other? They do not have the guts.',
      content:
          "In a fancy restaurant, a nobleman orders lamb ribs. When the chef sends the dish to the table, the nobleman appears dissatisfied and calls the head chef over. He complains that the lamb ribs are too small and insufficient. The head chef looks at the lamb ribs and says, \"Sir, we can't make them any bigger. If you want larger ribs, you should choose a bigger lamb!"),
  Joke(
      jokeId: 4,
      title: 'The Challenging Isolation',
      describe: 'I used to play piano by ear, but now I use my hands.',
      content:
          'During the pandemic lockdown, a couple decides to self-isolate at home. After a while, they become quite tense and argue daily. One day, the wife says, "Do you know, we\'ve been isolating together for almost a month now, and you still get used to me like this?" The husband looks at her with a smile and says, "Of course, dear. How couldn\'t I get used to it when we\'ve been living together for 10 years!'),
  Joke(
      jokeId: 5,
      title: 'Aspiring for Wealth',
      describe:
          "I'm reading a book on anti-gravity. It's impossible to put down.",
      content:
          'A young man visits an astrologer to seek insights into his future. The astrologer asks him, "What is your biggest dream?" He replies, "I want to be wealthy, I want money and everything that money can buy." The astrologer says, "Oh, that\'s simple. You just need to start by paying me to know about your future.'),
];
