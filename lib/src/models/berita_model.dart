class BeritaModel {
  String id;
  String title;
  String resourceType;
  String url;
  String urlThumbnail;

  BeritaModel({
    this.id = '',
    this.title = '',
    this.resourceType = '',
    this.url = '',
    this.urlThumbnail = '',
  });

  static List<BeritaModel> listData = [
    BeritaModel(
      id: "c1cdb568-27b2-11ea-978f-2e728ce88125",
      title: "Neque porro quisquam est qui dolorem ipsum quia",
      resourceType: "video",
      url: "",
      urlThumbnail: "https://3.bp.blogspot.com/-OAhMedDBtVQ/WfHxHG1a0NI/AAAAAAAAB2Y/BEn_tfx5VtsSDcSs__Iy3b8DDAH-EhFWACLcBGAs/s1600/Lagu%252C%2BLatte%2Bdan%2B%25E2%2580%259CLamington%25E2%2580%259D%2BRayakan%2BKreativitas%2BAlumni%2BAustralia%2B-%2BLorong%2BMusik.jpg"
    ),
    BeritaModel(
      id: "33edfaae-27b3-11ea-978f-2e728ce88125",
      title: "Berita talks Afrosoul music, culture and African fashion",
      resourceType: "video",
      url: "",
      urlThumbnail: "https://www.newtimes.co.rw/sites/default/files/styles/mystyle/public/main/articles/2018/05/28/berita_who_arrived_in_kigali_last_tuesday_said_she_enjoyed_her_saturday_show_and_her_brief_stay_in_the_country._she_returned_to_south_africa_sunday_morning.jpg"
    ),
    BeritaModel(
      id: "79f0412e-27b3-11ea-978f-2e728ce88125",
      title: "Journalism courses | News Associates - London and Manchester",
      resourceType: "image",
      url: "",
      urlThumbnail: "https://www.wto.org/images/img_index/photos/ittc010219_lg.jpg"
    ),
  ];
}
