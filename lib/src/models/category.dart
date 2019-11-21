class Category {
  String mentor;
  String job;
  String title;
  int lessonCount;
  double money;
  double rating;
  String imagePath;

  Category({
    this.mentor = '',
    this.job = '',
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,
  });

  static List<Category> categoryList = [
    Category(
      imagePath: 'https://static.skillshare.com/uploads/video/thumbnails/3621ffeb6285ff9abbf440064fe6a670/448-252',
      title: 'Strategi Efektif Belajar Gitar Akustik & Elektrik',
      mentor: 'Ari Moreno',
      job: 'Musician',
      lessonCount: 24,
      money: 999.999,
      rating: 4.3,
    ),
    Category(
      imagePath: 'https://static.skillshare.com/uploads/video/thumbnails/25018f1aada2a9c55ffb98ddf7c86aa0/448-252',
      title: 'Strategi Efektif Belajar Gitar Akustik & Elektrik',
      mentor: 'Ari Moreno',
      job: 'Musician',
      lessonCount: 22,
      money: 999.999,
      rating: 4.6,
    ),
    Category(
      imagePath: 'https://static.skillshare.com/uploads/video/thumbnails/52c2721527717ca5373d2f6dacc205c2/448-252',
      title: 'Strategi Efektif Belajar Gitar Akustik & Elektrik',
      mentor: 'Ari Moreno',
      job: 'Musician',
      lessonCount: 24,
      money: 999.999,
      rating: 4.3,
    ),
    Category(
      imagePath: 'https://static.skillshare.com/uploads/video/thumbnails/d8eb017e39b0b6045ffa38ef3620086a/448-252',
      title: 'Strategi Efektif Belajar Gitar Akustik & Elektrik',
      mentor: 'Ari Moreno',
      job: 'Musician',
      lessonCount: 22,
      money: 999.999,
      rating: 4.6,
    ),
  ];

  static List<Category> popularCourseList = [
    Category(
      imagePath: 'https://static.skillshare.com/uploads/video/thumbnails/25018f1aada2a9c55ffb98ddf7c86aa0/448-252',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'https://static.skillshare.com/uploads/video/thumbnails/25018f1aada2a9c55ffb98ddf7c86aa0/448-252',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'https://static.skillshare.com/uploads/video/thumbnails/25018f1aada2a9c55ffb98ddf7c86aa0/448-252',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'https://static.skillshare.com/uploads/video/thumbnails/25018f1aada2a9c55ffb98ddf7c86aa0/448-252',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
  ];
}
