class UserFilter {
  String name;

  UserFilter(this.name);

  Map<String, dynamic> toJson() {
    return {
      "userName": name,
    };
  }

  factory UserFilter.createDefault() {
    return UserFilter("");
  }
}