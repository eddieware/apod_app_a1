class ApodImage {
  String copyright;
  String date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;

  ApodImage({
    this.copyright,
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  ApodImage.fromJsonMap(Map<String, dynamic> json) {
    copyright = json['copyright'];
    date = json['date'];
    explanation = json['explanation'];
    hdurl = json['hdurl'];
    mediaType = json['media_type'];
    serviceVersion = json['service_version'];
    title = json['title'];
    url = json['url'];
  }
}

class ApodList {
  List<ApodImage> items = List();

  ApodList();
  ApodList.fromJsonList(List<dynamic> jsonList) {
    //modelo para trabajar el json
    if (jsonList == null) return; //si es nulo regresa
    for (var item in jsonList) {
      //si no si no haz un for y metelos a apodImage
      final apodImage = ApodImage.fromJsonMap(item);
      items.add(apodImage);
    }
  }
}
