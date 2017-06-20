export class User {
  public name: string = '';
  public email: string = '';
  public password: string = '';
  public street: string;
  constructor(
    name: string,
    email: string,
    password: string,
    street: string
  ){
    this.name = name;
    this.email = email;
    this.password = password;
    this.street = street;

  }
}
