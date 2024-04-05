//
//  StudentFormView.swift
//  commYOUnityCares
//
//  Created by Javon Carlyle Thomas on 4/5/24.
//

import SwiftUI

struct StudentFormView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var selectedOptions: [Int] = []
    @State private var isSubmitted = false
    
    let options = ["Financial Aid", "Food", "Clothing"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Text("Fill out the form below to inform your school of your need for assistance:")
                    .font(.headline)
                    .padding(.horizontal)
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Student Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .padding()
                
                HStack {
                    Text("Select assistance needed:")
                        .font(.subheadline)
                        .padding()
                    
                    Spacer()
                }
                
                ForEach(0..<3) { index in
                    CheckboxField(
                        title: self.options[index],
                        isChecked: self.selectedOptions.contains(index)
                    ) {
                        if self.selectedOptions.contains(index) {
                            self.selectedOptions.removeAll(where: { $0 == index })
                        } else {
                            self.selectedOptions.append(index)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Button(action: {
                    // Perform form submission here
                    submitForm()
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                if isSubmitted {
                    Text("Form submitted to your school.")
                        .foregroundColor(.green)
                        .padding()
                }
                
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    func submitForm() {
        // Here you can implement code to submit the form to the school
        // For demonstration purposes, we'll just set isSubmitted to true
        isSubmitted = true
    }
}

struct CheckboxField: View {
    let title: String
    let isChecked: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                Text(title)
                Spacer()
            }
        }
        .foregroundColor(.primary)
        .padding(.vertical, 8)
    }
}

struct StudentFormView_Previews: PreviewProvider {
    static var previews: some View {
        StudentFormView()
    }
}
