export class User {

  constructor(
    public name: string = '',
    public email: string = '',
    public password: string = '',
    public street: string =''
  ){
    this.name = name;
    this.email = email;
    this.password = password;
    this.street = street;

  }

}
