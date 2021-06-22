class CipherEntity {
  CipherEntity({
    required this.credential,
    required this.encryptKey,
  });

  String credential;
  String encryptKey;

  factory CipherEntity.fromJson(Map<String, dynamic> json) => CipherEntity(
        credential: json["credential"],
        encryptKey: json["encryptKey"],
      );

  Map<String, dynamic> toJson() => {
        "credential": credential,
        "encryptKey": encryptKey,
      };
}
