
class Comments{

  Comments({
    this.publishDate,
    this.id,
    this.message,
    this.owner,
    this.post
});
  final dynamic id ;
  final String message ;
  final dynamic owner;
  final dynamic post;
  final dynamic publishDate;

  getFullname(){
    return this.owner["title"] + ' ' + this.owner["firstName"]+ ' ' + this.owner["lastName"];
  }
}