import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:herd/config/paths.dart';
import 'package:herd/models/models.dart';


class Comment extends Equatable {
  final String id;
  final String postId;
  final User author;
  final String content;
  final DateTime date;

  const Comment ({
    this.id,
    @required this.postId,
    @required this.author,
    @required this.content,
    @required this.date,
  });

  @override
  List<Object> get props => [
    id,
    postId,
    author,
    content,
    date,
  ];

  Comment copyWith({
    String id,
    String postId,
    String author,
    String content,
    DateTime date,
  }) {
    return new Comment(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      author: author ?? this.author,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }


  Map <String, dynamic> toDocument(){
    return{
      'postId': postId,
      'author':
        FirebaseFirestore.instance.collection(Paths.users).doc(author.id),
      'content': content,
      'date': Timestamp.fromDate(date),
    };
  }

  static Future<Comment> fromDocument(DocumentSnapshot doc) async {
    if (doc == null) return null;
    final data = doc.data();
    final authorRef = (data as dynamic)['author'] as DocumentReference;
    if(authorRef != null) {

      final authorDoc = await authorRef.get();

      if(authorDoc.exists){
        return Comment(
          id: doc.id,
          author: User.fromDocument(authorDoc),
          postId: (data as dynamic)['postId'] ?? '',
          content: (data as dynamic)['content'] ?? '',
          date: ((data as dynamic)['date'] as Timestamp).toDate(),
        );
      }
    }
    return null;
  }
}