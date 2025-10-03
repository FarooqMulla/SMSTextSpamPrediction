//
//  ContentView.swift
//  SMSTextSpamPrediction
//
//  Created by Farooq Mulla on 10/3/25.
//

import SwiftUI
import NaturalLanguage
import CoreML

struct ContentView: View {
    @State private var longText: String = "Type your multiline text here..."
    @State private var prediction: String = ""
    @State private var sentimentScore: Double = 0.0
    
    lazy var nlModel: NLModel = {
        do {
            let model = try NLModel(mlModel: TextSPAMClassifier(configuration: MLModelConfiguration()).model)
            return model
        } catch {
            fatalError()
        }
    }()
    
    var body: some View {
        NavigationStack {
            VStack {
                MultilineTextView(text: $longText) { newText in
                        longText = newText
                    }
                    .frame(height: 300)
                    .padding()
                HStack {
                    Button {
                        prediction = ""
                        sentimentScore = 0.0
                        print("Validate button tapped!")
                        prediction = detectSpamMessage(longText)
                        sentimentScore = detectSentiment(longText)
                    } label: {
                        Text("Validate")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                            .background(Capsule().fill(.yellow))
                    }
                    .padding()
                    Button {
                        longText = ""
                        prediction = ""
                        sentimentScore = 0.0
                    } label: {
                        Text("Clear")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Capsule().fill(.gray))
                    }
                    .padding()
                }
                HStack {
                    Text("Prediction:")
                    Text("\(prediction)")
                        .font(.bold(.system(size: 17))())
                }
                HStack {
                    Text("Sentiment Score:")
                    Text("\(sentimentScore.formatted(.number.precision(.fractionLength(1))))")
                        .font(.bold(.system(size: 17))())
                }
                .padding()
            }
            .padding()
            .navigationTitle("SMS Text Spam Classifier")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func detectSpamMessage(_ message: String) -> String {
        do {
            let model = try NLModel(mlModel: TextSPAMClassifier(configuration: MLModelConfiguration()).model)
            let prediction = model.predictedLabel(for: message)
            return prediction ?? ""
        } catch { }
        return ""
    }

    func detectSentiment(_ message: String) -> Double {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = message

        let (sentiment, _) = tagger.tag(at: message.startIndex, unit: .paragraph, scheme: .sentimentScore)
        guard let score = sentiment?.rawValue else { return 0.0 }
        print("Farooq: Sentiment Score - \(score) - \(message)")
        return Double(score) ?? 0.0
    }
}

#Preview {
    ContentView()
}
