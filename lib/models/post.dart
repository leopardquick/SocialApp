

class Post{

  Post({
    this.id,
    this.image,
    this.likes,
    this.tags,
    this.text,
    this.publishDate,
    this.owner,
});

  final dynamic id ;
  final dynamic image;
  final int likes;
  final List<dynamic> tags;
  final String text;
  final String publishDate;
  final dynamic owner;

  getFullname(){
    return this.owner["title"] + ' ' + this.owner["firstName"]+ ' ' + this.owner["lastName"];
  }
}