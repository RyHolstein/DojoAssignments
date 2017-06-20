export class Quote {

  constructor(
    public author: string,
    public quote: string,
    public likes: number
  ){
    this.author = author;
    this.quote = quote;
    this.likes = 0;
  }
}
