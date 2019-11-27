class Mentor {
  String mentor;
  String job;
  String title;
  int lessonCount;
  double money;
  double rating;
  String imagePath;

  Mentor({
    this.mentor = '',
    this.job = '',
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,
  });

  static List<Mentor> categoryList = [
    Mentor(
      imagePath: 'https://www.naomilloyd.co.uk/v/ui/9117/p83416804_1.jpg?1505835239',
      title: 'Strategi Efektif Belajar Gitar Akustik & Elektrik',
      mentor: 'Ari Moreno',
      job: 'Musician',
      lessonCount: 24,
      money: 999.999,
      rating: 4.3,
    ),
    Mentor(
      imagePath: 'http://kurtliuphotography.com/wp-content/uploads/2016/05/D4S_2679.jpg',
      title: 'Strategi Efektif Belajar Gitar Akustik & Elektrik',
      mentor: 'Kurt Liu',
      job: 'Photographer',
      lessonCount: 22,
      money: 999.999,
      rating: 4.6,
    ),
    Mentor(
      imagePath: 'https://i1.wp.com/www.timgander.co.uk/wp-content/uploads/2016/06/Hamid-Falaki_022.jpg?fit=600%2C900&ssl=1',
      title: 'Strategi Efektif Belajar Gitar Akustik & Elektrik',
      mentor: 'Tim Gander',
      job: 'Photographer',
      lessonCount: 24,
      money: 999.999,
      rating: 4.3,
    ),
    Mentor(
      imagePath: 'http://image14.photobiz.com/9131/3_20180209162039_22624770_medium.jpg',
      title: 'Strategi Efektif Belajar Gitar Akustik & Elektrik',
      mentor: 'CL Becker',
      job: 'Chef',
      lessonCount: 22,
      money: 999.999,
      rating: 4.6,
    ),
  ];

  static List<Mentor> popularCourseList = [
    Mentor(
      imagePath: 'https://www.naomilloyd.co.uk/v/ui/9117/p83416804_1.jpg?1505835239',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Mentor(
      imagePath: 'https://www.naomilloyd.co.uk/v/ui/9117/p83416804_1.jpg?1505835239',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Mentor(
      imagePath: 'https://www.naomilloyd.co.uk/v/ui/9117/p83416804_1.jpg?1505835239',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Mentor(
      imagePath: 'https://www.naomilloyd.co.uk/v/ui/9117/p83416804_1.jpg?1505835239',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
  ];
}
