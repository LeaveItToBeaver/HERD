import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:herd/config/paths.dart';
import 'package:herd/models/models.dart';

class Post extends Equatable {
  final String id;
  final User author;
  final String imageUrl;
  final String caption;
  final String title;
  final int likes;
  final int dislikes;
  final DateTime date;

  const Post({
    this.id,
    @required this.author,
    @required this.imageUrl,
    @required this.caption,
    @required this.title,
    @required this.likes,
    @required this.dislikes,
    @required this.date,
  });

  List<Object> get props => [
    id,
    author,
    imageUrl,
    caption,
    title,
    likes,
    dislikes,
    date,
  ];

  Post copyWith({
    String id,
    User author,
    String imageUrl,
    String caption,
    String title,
    int likes,
    int dislikes,
    DateTime date,
  }) {
    return new Post(
      id: id ?? this.id,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      caption: caption ?? this.caption,
      title: title ?? this.title,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toDocument(){
    return {
      'author':
        FirebaseFirestore.instance.collection(Paths.users).doc(author.id),
      'imageUrl': imageUrl,
      'caption': caption,
      'title': title,
      'likes': likes,
      'dislikes': dislikes,
      'date': Timestamp.fromDate(date),
    };
  }

  static Future<Post> fromDocument(DocumentSnapshot doc) async {
   if (doc == null) return null;
   final data = doc.data();
   final authorRef = data['author'] as DocumentReference;
   if (authorRef != null){
     final authorDoc = await authorRef.get();
     if(authorDoc.exists){
       return Post(
           id: doc.id,
           author: User.fromDocument(authorDoc),
           imageUrl: data['imageUrl'] ?? '',
           caption: data['caption'] ?? '',
           title: data['title'] ?? '',
           likes: (data['likes'] ?? 0).toInt(),
           dislikes: (data['dislikes'] ?? 0).toInt(),
           date: (data['date'] as Timestamp).toDate(),
       );
     }
   }
   return null;
  }
}
