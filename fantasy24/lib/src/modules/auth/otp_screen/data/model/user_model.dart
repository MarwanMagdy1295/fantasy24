class UserModel {
  String? id;
  String? email;
  String? name;
  String? role;
  String? password;
  String? fplTeamId;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? profileImageUrl;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.role,
    this.password,
    this.fplTeamId,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        role: json["role"],
        password: json["password"],
        fplTeamId: json["fpl_team_id"],
        isVerified: json["is_verified"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profileImageUrl: json["profile_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "role": role,
        "password": password,
        "fpl_team_id": fplTeamId,
        "is_verified": isVerified,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "profile_image_url": profileImageUrl,
      };
}
