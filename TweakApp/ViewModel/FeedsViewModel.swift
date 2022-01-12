//
//  FeedsViewModel.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//

import Foundation

class FeedsViewModel {
    
    let newsFeedData : [Post] = [
        Post(profilePicture: "Juan", userName: "Juan", hour: "5 hrs", postText: "Im really excited to talk about this.", postImage: "Post1"),
        Post(profilePicture: "Kimberly", userName: "Kimberly", hour: "2 hrs", postText: "With On the Road, the most enduring piece of literature from the mythologized Beat Generation, and of the two, the better one. Even the least literate of your friends would probably recognize the line", postImage: "Post2"),
        Post(profilePicture: "Paola", userName: "Paola", hour: "1 hr", postText: "It has never failed to be equal to both the fracture of its own era and what, alas, turned out to be the even greater fracture of the ongoing 20th century and now, it seems, the 21st century.", postImage: "Post3"),
        Post(profilePicture: "Maricela", userName: "Maricela", hour: "2 hrs", postText: "Yes, I just bought my new Tesla and I'd like to drive it arround Europe", postImage: "Post4"),
        Post(profilePicture: "Fernanda", userName: "Fernanda", hour: "7 hrs", postText: "What a wonderful day with the prettiest person in the world.🥰", postImage: "Post5"),
        Post(profilePicture: "Julio", userName: "Julio", hour: "12 hrs", postText: "This was the most legendary party that I've never been before.😈", postImage: "Post6"),
        Post(profilePicture: "Alfredo", userName: "Alfredo", hour: "3 hrs", postText: "Im so bad playing this new game but it does no matter, Im a begginner.😅", postImage: "Post7"),
    ]
    
    let chatData : [Message] = [
        Message(title: "Rosaura", body: "What's up", imageName: "Rosaura"),
        Message(title: "Emy", body: "Hello", imageName: "Emy"),
        Message(title: "Maricela", body: "How you doing?", imageName: "Maricela"),
        Message(title: "Alfredo", body: "Youre welcome", imageName: "Alfredo"),
        Message(title: "Juan", body: "I need to tell you something", imageName: "Juan")
    ]
    
    let notificationData : [Notification] = [
        Notification(body: "Rosaura has sent you a friend request.", imageName: "Rosaura"),
        Notification(body: "Ariana has seen your story.", imageName: "Ariana"),
        Notification(body: "Mariano has shared a post.", imageName: "Mariano"),
        Notification(body: "Kimberly just shared a post.", imageName: "Kimberly"),
        Notification(body: "Emy is new on Tweak, say hi.", imageName: "Emy"),
        Notification(body: "Theres no reason to be a developer, please help me.", imageName: "Paola"),
        Notification(body: "Are you waiting for new events? please contact me.", imageName: "Juan"),
        Notification(body: "Paola just shared a post.", imageName: "Paola")
    ]
    
    let profileData : [Post] = [Post(profilePicture: "Miguel", userName: "Miguel", hour: "1 hrs", postText: "This is a test.", postImage: "post8"),
                         Post(profilePicture: "Miguel", userName: "Miguel", hour: "2 hrs", postText: "to share my knowledge.", postImage: "post11"),
                         Post(profilePicture: "Miguel", userName: "Miguel", hour: "4 hrs", postText: "Thank you.", postImage: "post9"),
                         Post(profilePicture: "Miguel", userName: "Miguel", hour: "8 hrs", postText: "For paying attention.", postImage: "post10")]
    
}
