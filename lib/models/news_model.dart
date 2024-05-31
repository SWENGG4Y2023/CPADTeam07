class NewsData {
  final String newsId;
  final String newsBannerImageUrl;
  final String newsHeading;
  final String newsSubheading;
  final String newsContent;
  final String createdOn;
  final String locationName;
  final String status;
  final String startDate;
  final String expiry;
  final String locationCode;
  final String lastChangedOn;
  final bool deleted;
  final String postedBy;
  bool saved;

  NewsData({
    required this.newsId,
    required this.newsBannerImageUrl,
    required this.newsHeading,
    required this.newsSubheading,
    required this.newsContent,
    required this.createdOn,
    required this.locationName,
    required this.status,
    required this.startDate,
    required this.expiry,
    required this.locationCode,
    required this.lastChangedOn,
    required this.deleted,
    required this.postedBy,
    required this.saved,
  });

  static NewsData fromJson(Map<String, dynamic> json) {
    return NewsData(
        newsId: json["newsId"] ?? "",
        newsBannerImageUrl: json["newsBannerImageUrl"] ?? "",
        newsHeading: json["newsHeading"] ?? "",
        newsSubheading: json["newsSubheading"] ?? "",
        newsContent: json["newsContent"] ?? "",
        createdOn: json["createdOn"] ?? "",
        locationName: json["locationName"] ?? "",
        status: json["status"] ?? "",
        startDate: json["startDate"] ?? "",
        expiry: json["expiry"] ?? "",
        locationCode: json["locationCode"] ?? "",
        lastChangedOn: json["lastChangedOn"] ?? "",
        deleted: json["deleted"] ?? false,
        postedBy: json["postedBy"] ?? "",
        saved: json["isSaved"] ?? false);
  }

  static List<NewsData> fromJSONList(List<dynamic> json) {
    return json
        .map((news) => NewsData(
              newsId: news["newsId"] ?? "",
              newsBannerImageUrl: news["newsBannerImageUrl"] ?? "",
              newsHeading: news["newsHeading"] ?? "",
              newsSubheading: news["newsSubheading"] ?? "",
              newsContent: news["newsContent"] ?? "",
              createdOn: news["createdOn"] ?? "",
              locationName: news["locationName"] ?? "",
              status: news["status"] ?? "",
              startDate: news["startDate"] ?? "",
              expiry: news["expiry"] ?? "",
              locationCode: news["locationCode"] ?? "",
              lastChangedOn: news["lastChangedOn"] ?? "",
              deleted: news["deleted"] ?? false,
              postedBy: news["postedBy"] ?? "",
              saved: news["isSaved"] ?? false,
            ))
        .toList();
  }

  Map<String, dynamic> toJSON() => {
        "newsId": newsId,
        "newsBannerImageUrl": newsBannerImageUrl,
        "newsHeading": newsHeading,
        "newsSubheading": newsSubheading,
        "newsContent": newsContent,
        "createdOn": createdOn,
        "locationName": locationName,
        "status": status,
        "startDate": startDate,
        "expiry": expiry,
        "lastChangedOn": lastChangedOn,
        "deleted": deleted,
        "postedBy": postedBy,
        "isSaved": saved
      };
}
