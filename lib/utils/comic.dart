
class Comic {
  String name;
  String author;
  String cover;
  String lastChapter;
  String url;

  Comic.fromMap(Map<String, String> comic) {
    name = comic['name'];
    author = comic['author'];
    cover = comic['cover'];
    url = comic['url'];
    lastChapter = comic["lastChapter"];
  }

  Comic({
    this.name,
    this.author,
    this.cover,
    this.url,
    this.lastChapter,
  });
}
