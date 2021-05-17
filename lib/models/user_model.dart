import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String email;
  final String profileImageURL;
  final String coverImageURL;
  final String firstName;
  final String lastName;
  final int followers;
  final int following;
  final String bio;

  const User({
    @required this.id,
    @required this.username,
    @required this.email,
    @required this.profileImageURL,
    @required this.coverImageURL,
    @required this.firstName,
    @required this.lastName,
    @required this.followers,
    @required this.following,
    @required this.bio});
  
  static const empty = User(
      id: '',
      username: '',
      email: '',
      profileImageURL: '',
      coverImageURL: '',
      firstName: '',
      lastName: '',
      followers: 0,
      following: 0,
      bio: ''
  );

  @override
  List<Object> get props => [
    id,
    username,
    email,
    profileImageURL,
    coverImageURL,
    firstName,
    lastName,
    followers,
    following,
    bio,
  ];

  User copyWith({
    String id,
    String username,
    String email,
    String profileImageURL,
    String coverImageURL,
    String firstName,
    String lastName,
    int followers,
    int following,
    String bio,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (username == null || identical(username, this.username)) &&
        (email == null || identical(email, this.email)) &&
        (profileImageURL == null ||
            identical(profileImageURL, this.profileImageURL)) &&
        (coverImageURL == null ||
            identical(coverImageURL, this.coverImageURL)) &&
        (firstName == null || identical(firstName, this.firstName)) &&
        (lastName == null || identical(lastName, this.lastName)) &&
        (followers == null || identical(followers, this.followers)) &&
        (following == null || identical(following, this.following)) &&
        (bio == null || identical(bio, this.bio))) {
      return this;
    }

    return new User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      profileImageURL: profileImageURL ?? this.profileImageURL,
      coverImageURL: coverImageURL ?? this.coverImageURL,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toDocument() {
    return{
      'username': username,
      'email': email,
      'profileImageURL': profileImageURL,
      'coverImageURL': coverImageURL,
      'firstName': firstName,
      'lastName': lastName,
      'followers': followers,
      'following': following,
    };
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    if (doc == null) return null;
    final data = doc.data();
    return User(
      id: doc.id,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      profileImageURL: data['profileImageURL'] ?? '',
      coverImageURL: data['coverImageURL'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      followers: (data['followers'] ?? 0).toInt(),
      following: (data['following'] ?? 0).toInt(),
      bio: data['bio'] ?? '',
    );
  }
}
