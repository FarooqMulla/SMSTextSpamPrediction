//
//  MultilineTextView.swift
//  SMSTextSpamPrediction
//
//  Created by Farooq Mulla on 10/3/25.
//

import SwiftUI

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String
    var onTextChange: ((String) -> Void)? = nil
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.backgroundColor = .lightGray
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.cornerRadius = 5.0
        textView.clearsContextBeforeDrawing = true
        textView.isUserInteractionEnabled = true
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.delegate = context.coordinator
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextView

        init(_ parent: MultilineTextView) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
           parent.text = textView.text
           parent.onTextChange?(textView.text)
       }
    }
}
