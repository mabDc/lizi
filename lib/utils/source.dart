class Source{
  double id;
  String name;
  String host;
  SourceComic search;
  SourceChapter chapter;
  String image;
}

class SourceComic{
  String src;
  String searchList;
  String cover;
  String name;
  String author;
  String time;
  String tag;
  String url;
}

class SourceChapter{
  String src;
  String chapterList;
  bool chaptersReverse;
  String name;
  String url;
  String time;
  String lock;
}
