class AccountEntity {
  String? token;

  AccountEntity(this.token) {
    // in case its null
    token = token ?? "null";
  }
}
