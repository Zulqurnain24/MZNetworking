//
//  WebserviceResponse.swift
//  MZNetworkingTests
//
//  Created by Mohammad Zulqarnain on 26/12/2019.
//  Copyright © 2019 Binary Leaf Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

let jsonWebserviceResponseSuccessStub = """
[
{
    \"id\":\"4kQA1aQK8-Y\",
    \"created_at\":\"2016-05-29T15:42:02-04:00\",
    \"width\":2448,
    \"height\":1836,
    \"color\":\"#060607\",
    \"likes\":12,
    \"liked_by_user\":false,
    \"user\":{
        \"id\":\"OevW4fja2No\",
        \"username\":\"nicholaskampouris\",
        \"name\":\"Nicholas Kampouris\",
        \"profile_image\":{
            \"small\":\"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=faces\\u0026fit=crop\\u0026h=32\\u0026w=32\\u0026s=63f1d805cffccb834cf839c719d91702\",
            \"medium\":\"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=faces\\u0026fit=crop\\u0026h=64\\u0026w=64\\u0026s=ef631d113179b3137f911a05fea56d23\",
            \"large\":\"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=faces\\u0026fit=crop\\u0026h=128\\u0026w=128\\u0026s=622a88097cf6661f84cd8942d851d9a2\"
        },
        \"links\":{
            \"self\":\"https://Webservice.unsplash.com/users/nicholaskampouris\",
            \"html\":\"http://unsplash.com/@nicholaskampouris\",
            \"photos\":\"https://Webservice.unsplash.com/users/nicholaskampouris/photos\",
            \"likes\":\"https://Webservice.unsplash.com/users/nicholaskampouris/likes\"
        }
    },
    \"current_user_collections\":[
    
    ],
    \"urls\":{
        \"raw\":\"https://images.unsplash.com/photo-1464550883968-cec281c19761\",
        \"full\":\"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=entropy\\u0026s=4b142941bfd18159e2e4d166abcd0705\",
        \"regular\":\"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=entropy\\u0026w=1080\\u0026fit=max\\u0026s=1881cd689e10e5dca28839e68678f432\",
        \"small\":\"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=entropy\\u0026w=400\\u0026fit=max\\u0026s=d5682032c546a3520465f2965cde1cec\",
        \"thumb\":\"https://images.unsplash.com/photo-1464550883968-cec281c19761?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=entropy\\u0026w=200\\u0026fit=max\\u0026s=9fba74be19d78b1aa2495c0200b9fbce\"
    },
    \"categories\":[
    {
    \"id\":4,
    \"title\":\"Nature\",
    \"photo_count\":46148,
    \"links\":{
    \"self\":\"https://Webservice.unsplash.com/categories/4\",
    \"photos\":\"https://Webservice.unsplash.com/categories/4/photos\"
    }
    },
    {
    \"id\":6,
    \"title\":\"People\",
    \"photo_count\":15513,
    \"links\":{
    \"self\":\"https://Webservice.unsplash.com/categories/6\",
    \"photos\":\"https://Webservice.unsplash.com/categories/6/photos\"
    }
    }
    ],
    \"links\":{
        \"self\":\"https://Webservice.unsplash.com/photos/4kQA1aQK8-Y\",
        \"html\":\"http://unsplash.com/photos/4kQA1aQK8-Y\",
        \"download\":\"http://unsplash.com/photos/4kQA1aQK8-Y/download\"
    }
},
{
    \"id\":\"H_M4dX_F1LQ\",
    \"created_at\":\"2016-05-29T15:41:15-04:00\",
    \"width\":2720,
    \"height\":1532,
    \"color\":\"#1C1C18\",
    \"likes\":12,
    \"liked_by_user\":false,
    \"user\":{
        \"id\":\"OevW4fja2No\",
        \"username\":\"nicholaskampouris\",
        \"name\":\"Nicholas Kampouris\",
        \"profile_image\":{
            \"small\":\"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=faces\\u0026fit=crop\\u0026h=32\\u0026w=32\\u0026s=63f1d805cffccb834cf839c719d91702\",
            \"medium\":\"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=faces\\u0026fit=crop\\u0026h=64\\u0026w=64\\u0026s=ef631d113179b3137f911a05fea56d23\",
            \"large\":\"https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=faces\\u0026fit=crop\\u0026h=128\\u0026w=128\\u0026s=622a88097cf6661f84cd8942d851d9a2\"
        },
        \"links\":{
            \"self\":\"https://Webservice.unsplash.com/users/nicholaskampouris\",
            \"html\":\"http://unsplash.com/@nicholaskampouris\",
            \"photos\":\"https://Webservice.unsplash.com/users/nicholaskampouris/photos\",
            \"likes\":\"https://Webservice.unsplash.com/users/nicholaskampouris/likes\"
        }
    },
    \"current_user_collections\":[
    
    ],
    \"urls\":{
        \"raw\":\"https://images.unsplash.com/photo-1464550838636-1a3496df938b\",
        \"full\":\"https://images.unsplash.com/photo-1464550838636-1a3496df938b?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=entropy\\u0026s=ea8f203f18a51214459deec7301f177f\",
        \"regular\":\"https://images.unsplash.com/photo-1464550838636-1a3496df938b?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=entropy\\u0026w=1080\\u0026fit=max\\u0026s=67b8dcbfc47e2ba3f39d2d01a8177864\",
        \"small\":\"https://images.unsplash.com/photo-1464550838636-1a3496df938b?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=entropy\\u0026w=400\\u0026fit=max\\u0026s=b14d332748fd4ff66c6a5ed5d62dcd9e\",
        \"thumb\":\"https://images.unsplash.com/photo-1464550838636-1a3496df938b?ixlib=rb-0.3.5\\u0026q=80\\u0026fm=jpg\\u0026crop=entropy\\u0026w=200\\u0026fit=max\\u0026s=9947985b2095f1c8fbbbe09a93b9b1d9\"
    },
    \"categories\":[
    {
    \"id\":4,
    \"title\":\"Nature\",
    \"photo_count\":46148,
    \"links\":{
    \"self\":\"https://Webservice.unsplash.com/categories/4\",
    \"photos\":\"https://Webservice.unsplash.com/categories/4/photos\"
    }
    }
    ],
    \"links\":{
        \"self\":\"https://Webservice.unsplash.com/photos/H_M4dX_F1LQ\",
        \"html\":\"http://unsplash.com/photos/H_M4dX_F1LQ\",
        \"download\":\"http://unsplash.com/photos/H_M4dX_F1LQ/download\"
    }
}
]
""".data(using: .utf8)!


let xmlWebserviceResponseStub = """
<responseHeaderDto>
<isError>false</isError>
<message>OK</message>
<statusCode>0</statusCode>
</responseHeaderDto>
""".data(using: .utf8)!

let imageStub = loadImage(name: "sampleImage", type: "jpeg")
let imageDataStub = imageStub?.pngData()

func loadImage(name: String, type: String) -> UIImage? {
    guard let imageString = Bundle.init(for: NetworkManagerTests.self).path(forResource: name, ofType: type) else {
        return nil
    }
    
    return UIImage(contentsOfFile: imageString)
}

