//
//  FeedbackEndpoint.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//

import Foundation
import Alamofire

enum OrderEndpoint: EndpointProtocol {
    case addFeedback(model:FeedbackRequestModel)
    
    var path: String {
        
        switch self {
        case .addFeedback:
            return ServiceConstants.feedbackUrl
        }
    }
    
    var method: Method {
        switch self {
        case .addFeedback:
            return .post
        }
    }
    
    var headers: Headers? {
        switch self {
        case .addFeedback:
            return ["Content-Type": "application/json"]
        }
    }
    var encoding: ParameterEncoding {
        switch self {
        
        case .addFeedback:
            return JSONEncoding.default
        }
    }
    var parameters: Parameters? {
        switch self {
            
        case .addFeedback(let model):
            return ["tourID": model.tourID,
                    "estimationOfTour": model.estimationOfTour,
                    "estimationOfGuide": model.estimationOfGuide,
                    "submissionOfInformation": model.submissionOfInformation,
                    "navigatingBetweenSteps": model.navigatingBetweenSteps,
                    "positiveText": model.positiveText,
                    "adviceText": model.adviceText]
        }
    }
    
    var baseUrl: URL? {
        switch self {
        case .addFeedback:
            return URL(string: APIURL.urlFeedback.rawValue)
        }
    }
}
