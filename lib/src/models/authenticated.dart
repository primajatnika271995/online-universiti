// To parse this JSON data, do
//
//     final authenticated = authenticatedFromJson(jsonString);

import 'dart:convert';

Authenticated authenticatedFromJson(String str) => Authenticated.fromJson(json.decode(str));

String authenticatedToJson(Authenticated data) => json.encode(data.toJson());

class Authenticated {
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String scope;
  String contact;
  String imageUrl;
  String name;
  String email;
  String jti;

  Authenticated({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
    this.contact,
    this.imageUrl,
    this.name,
    this.email,
    this.jti,
  });

  factory Authenticated.fromJson(Map<String, dynamic> json) => Authenticated(
    accessToken: json["access_token"] == null ? null : json["access_token"],
    tokenType: json["token_type"] == null ? null : json["token_type"],
    refreshToken: json["refresh_token"] == null ? null : json["refresh_token"],
    expiresIn: json["expires_in"] == null ? null : json["expires_in"],
    scope: json["scope"] == null ? null : json["scope"],
    contact: json["contact"] == null ? null : json["contact"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    jti: json["jti"] == null ? null : json["jti"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken == null ? null : accessToken,
    "token_type": tokenType == null ? null : tokenType,
    "refresh_token": refreshToken == null ? null : refreshToken,
    "expires_in": expiresIn == null ? null : expiresIn,
    "scope": scope == null ? null : scope,
    "contact": contact == null ? null : contact,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "jti": jti == null ? null : jti,
  };
}
