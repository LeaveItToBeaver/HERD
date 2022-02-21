const functions = require("firebase-functions");
const admin = require('firebase-admin');
const { userRecordConstructor } = require("firebase-functions/v1/auth");


admin.initializeApp();

exports.onFollowUser = functions.firestore.document(
    '/followers/{userId}/userFollowers/{followerId}'
    ).onCreate(async (_, context) => {
        const userId = context.params.userId;
        const followerId = context.params.followerId;

        const followedUserRef = admin.firestore().collection('users').doc(userId);
        const followedUserDoc = await followedUserDoc.get();

        if (followedUserDoc.get('followers') !== undefined){
            followedUserRef.update({
                followers: followedUserDoc.get('followers') + 1,
            });
        }else {
            followedUserRef.update({followers: 1});
        }

        const userRef = admin.firestore().collection('users').doc(followerId);
        const userDoc = await userRef.get();
        if(userDoc.get('following') !== undefined) {
            userRef.update({following: userDoc.get('following') + 1});
        } else {
            userRef.update({following: 1});
        }

        //TODO: Add post logic to the functions. 
    });