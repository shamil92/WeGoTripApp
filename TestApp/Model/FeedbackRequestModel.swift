//
//  FeedbackRequestModel.swift
//  TestApp
//
//  Created by Shamil on 16.05.2022.
//

import Foundation

struct FeedbackRequestModel: Decodable {
    let tourID: Int
    let estimationOfTour: Float
    let estimationOfGuide: Float
    let submissionOfInformation: Float
    let navigatingBetweenSteps: Float
    let positiveText: String
    let adviceText: String
}
