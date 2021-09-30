class UserModel {
  String? name;
  String? surname;
  int? age;
  
  UserModel(
    this.name,
    this.surname,
    this.age,
  );

  DateTime get registerDateTime => DateTime.now();
}
