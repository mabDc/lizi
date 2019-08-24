class U17{
  static const name = "U17";
  static dynamic source = {
    "enable":true,
    "host":"http://app.u17.com",
    "search": "http://app.u17.com/v3/appV3_3/android/phone/search/searchResult?q={keyword}&page={page}",
    "searchList": "\$.data.returnData.comics",
    "name": "\$.name",
    "author": "\$.author",
    "cover": "\$.cover",
    "tag": "\$.tag",
    "detail": "http://app.u17.com/v3/appV3_3/android/phone/comic/detail_static_new?&comicid={\$.comicId}",
    "chapters": "\$.data.returnData.chapter_list",
    "chaptersName": "\$.name",
    "content": "http://app.u17.com/v3/app/android/phone/comic/chapter?chapter_id={\$.chapter_id}",
    "images": "\$.data.returnData.image_list..location"
  };
}