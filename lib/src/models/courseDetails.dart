class CourseDetails {
  String thumbnailUrl;
  String idVideo;
  String courseName;
  String times;
  bool lock;

  CourseDetails({
    this.thumbnailUrl = '',
    this.idVideo = '',
    this.courseName = '',
    this.times = '',
    this.lock = true,
  });

  static List<CourseDetails> courseDetailList = [
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "BBz-Jyr23M4",
      courseName: "Guitar Lesson 1 - Absolute Beginner?",
      times: "16:11",
      lock: false,
    ),
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "6Jxz9F3CYuo",
      courseName: "Guitar Lesson 2 - EASY 2 CHORD SONG & LEAD GUITAR",
      times: "16:06",
      lock: true,
    ),
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "SV2ehlxGEFw",
      courseName: "Guitar Lesson 3 - 'Three Little Birds' Guitar",
      times: "12:20",
      lock: true,
    ),
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "VK1Fe0mnXvE",
      courseName: "Guitar Lesson 4 - Your First Riff!",
      times: "12:48",
      lock: true,
    ),
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "VCIsdvZheC8",
      courseName: "Guitar Lesson 5 - 'Ooh La la' Rod Stewart & NEW Melody!",
      times: "17:07",
      lock: true,
    ),
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "Zr0WmWpeWL8",
      courseName: "Guitar Lesson 6 - EASY Fingerstyle & Minor Chords",
      times: "17:07",
      lock: true,
    ),
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "Ix0A3ps_vgg",
      courseName: "Guitar Lesson 7 - Play 10 Songs with 4 Chords",
      times: "18:40",
      lock: true,
    ),
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "dwVwAuO3NHA",
      courseName: "Guitar Lesson 8 - G Major Scale & NEW Song!",
      times: "15:06",
      lock: true,
    ),
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "WjPLAkGjH_g",
      courseName: "Guitar Lesson 9 - Open Chords And The Most Common",
      times: "12:46",
      lock: true,
    ),
    CourseDetails(
      thumbnailUrl: "https://www.sagemusic.co/wp-content/uploads/2018/04/6-1-1024x576.jpg",
      idVideo: "LNkDdyvqgJY",
      courseName: "Guitar Lesson 10 - Blues Shuffle Riff & Buddy Holly Song!",
      times: "15:07",
      lock: true,
    ),
  ];
}
