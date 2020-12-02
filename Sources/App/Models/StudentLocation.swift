//
//  File.swift
//  
//
//  Created by Chris Clark on 2020/11/28.
//
//
//  StudentLocation.swift
//  OnTheMapSwiftUI
//
//  Created by Chris Clark on 2020/11/27.
//

import Vapor
import Fluent

// DTO (data transfer object)
struct StudentLocationResults: Content {
    let results: [StudentLocation]
    
    static let sampleValue = StudentLocationResults(results: [StudentLocation.sampleValue])
}

// DTO (data transfer object)
struct StudentLocation: Content {
    let createdAt: String
    let firstName: String
    let lastName: String
    let latitude: Double
    let longitude: Double
    let mapString: String
    let mediaURL: String
    let objectId: String
    let uniqueKey: String
    let updatedAt: String
    
    // Memberwise initializer
    init(
        createdAt: String,
        firstName: String,
        lastName: String,
        latitude: Double,
        longitude: Double,
        mapString: String,
        mediaURL: String,
        objectId: String,
        uniqueKey: String,
        updatedAt: String) {
        
        self.createdAt = createdAt
        self.firstName = firstName
        self.lastName = lastName
        self.latitude = latitude
        self.longitude = longitude
        self.mapString = mapString
        self.mediaURL = mediaURL
        self.objectId = objectId
        self.uniqueKey = uniqueKey
        self.updatedAt = updatedAt
    }
    
    // Converts id to objectId
    init(studentLocationModel: StudentLocationModel) {
        self.createdAt = studentLocationModel.createdAt
        self.firstName = studentLocationModel.firstName
        self.lastName = studentLocationModel.lastName
        self.latitude = studentLocationModel.latitude
        self.longitude = studentLocationModel.longitude
        self.mapString = studentLocationModel.mapString
        self.mediaURL = studentLocationModel.mediaURL
        self.objectId = studentLocationModel.id?.uuidString ?? "N/A"
        self.uniqueKey = studentLocationModel.uniqueKey
        self.updatedAt = studentLocationModel.updatedAt
    }
    
    static let sampleValue = StudentLocation(
        createdAt: "2015-02-25T01:10:38.103Z",
        firstName: "Jarrod",
        lastName: "Parkes",
        latitude: 34.7303688,
        longitude: -86.5861037,
        mapString: "Huntsville, Alabama",
        mediaURL: "https://www.linkedin.com/in/jarrodparkes",
        objectId: "JhOtcRkxsh",
        uniqueKey: "996618664",
        updatedAt: "2015-03-09T22:04:50.315Z")
}

final class StudentLocationModel: Model {
    
    init() {}
    
    init(
        createdAt: String,
        firstName: String,
        lastName: String,
        latitude: Double,
        longitude: Double,
        mapString: String,
        mediaURL: String,
        uniqueKey: String,
        updatedAt: String) {
        
        self.createdAt = createdAt
        self.firstName = firstName
        self.lastName = lastName
        self.latitude = latitude
        self.longitude = longitude
        self.mapString = mapString
        self.mediaURL = mediaURL
        self.uniqueKey = uniqueKey
        self.updatedAt = updatedAt
    }
    
    // Ignores StudentLocation.objectId
    init(studentLocation: StudentLocation) {
        self.createdAt = studentLocation.createdAt
        self.firstName = studentLocation.firstName
        self.lastName = studentLocation.lastName
        self.latitude = studentLocation.latitude
        self.longitude = studentLocation.longitude
        self.mapString = studentLocation.mapString
        self.mediaURL = studentLocation.mediaURL
        self.uniqueKey = studentLocation.uniqueKey
        self.updatedAt = studentLocation.updatedAt
    }
    
    static let schema = "student_locations"
    
    @ID
    var id: UUID?
    
    @Field(key: "created_at")
    var createdAt: String
    @Field(key: "first_name")
    var firstName: String
    @Field(key: "last_name")
    var lastName: String
    @Field(key: "latitude")
    var latitude: Double
    @Field(key: "longitude")
    var longitude: Double
    @Field(key: "map_string")
    var mapString: String
    @Field(key: "media_url")
    var mediaURL: String
    @Field(key: "unique_key")
    var uniqueKey: String
    @Field(key: "updated_at")
    var updatedAt: String
}

/*
{
    "results":[
        {
            "createdAt": "2015-02-25T01:10:38.103Z",
            "firstName": "Jarrod",
            "lastName": "Parkes",
            "latitude": 34.7303688,
            "longitude": -86.5861037,
            "mapString": "Huntsville, Alabama",
            "mediaURL": "https://www.linkedin.com/in/jarrodparkes",
            "objectId": "JhOtcRkxsh",
            "uniqueKey": "996618664",
            "updatedAt": "2015-03-09T22:04:50.315Z"
        }
        {
            "createdAt":"2015-02-24T22:27:14.456Z",
            "firstName":"Jessica",
            "lastName":"Uelmen",
            "latitude":28.1461248,
            "longitude":-82.756768,
            "mapString":"Tarpon Springs, FL",
            "mediaURL":"www.linkedin.com/in/jessicauelmen/en",
            "objectId":"kj18GEaWD8",
            "uniqueKey":"872458750",
            "updatedAt":"2015-03-09T22:07:09.593Z"
        },
        {
            "createdAt":"2015-02-24T22:30:54.442Z",
            "firstName":"Jason",
            "lastName":"Schatz",
            "latitude":37.7617,
            "longitude":-122.4216,
            "mapString":"18th and Valencia, San Francisco, CA",
            "mediaURL":"http://en.wikipedia.org/wiki/Swift_%28programming_language%29",
            "objectId":"hiz0vOTmrL",
            "uniqueKey":"2362758535",
            "updatedAt":"2015-03-10T17:20:31.828Z"
        },
        {
            "createdAt": "2015-02-24T22:35:30.639Z",
            "firstName": "Gabrielle",
            "lastName": "Miller-Messner",
            "latitude": 35.1740471,
            "longitude": -79.3922539,
            "mapString": "Southern Pines, NC",
            "mediaURL": "http://www.linkedin.com/pub/gabrielle-miller-messner/11/557/60/en",
            "objectId": "8ZEuHF5uX8",
            "uniqueKey": "2256298598",
            "updatedAt": "2015-03-09T22:06:11.615Z"
        }
    ]
}
 */
