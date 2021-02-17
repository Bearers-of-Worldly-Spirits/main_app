//
//  SubmitView.swift
//  SeniorDesign
//
//  Created by Josh Arnold on 2/16/21.
//

import SwiftUI
import Alamofire


struct SubmitView: View {
    
    var dismiss:() -> ()
    
    @State private var resultText:String = "You should receive an email any second with your completed tax document."
    @State private var text:String = "Submitting Form"
    @State private var opacity:Double = 1.0
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                                        
                Text(text)
                    .font(Font.custom(Theme.fontName, size: 40).weight(.light))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Primary"))
                    .padding()                    
                                                    
                if opacity > 0 {
                    LoadingView()
                        .opacity(opacity)
                        .padding(50)
                } else {
                    Text(resultText)
                        .font(Font.custom(Theme.fontName, size: 16).weight(.medium))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(.secondaryLabel))
                        .padding()
                        .frame(maxWidth: Theme.maxScreenWidth)
                }
            
                ButtonFill(title: "Continue", action: {
                    dismiss()
                }).opacity(1 - opacity)                
            }
            .frame(maxWidth: .infinity)
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                submitForm()
            }
        }
        
        .background(Color("Background").ignoresSafeArea())
    }
    
    func submitForm() {
        let parameters = try! FormCompiler.form8843().asDictionary()
        
        print(parameters)
        
        AF.request(Theme.pdfAPIEndPoint, method:.post, parameters: parameters,encoding: JSONEncoding.default) .responseJSON { (response) in
                print(response.result)

                switch response.result {

                case .success(_):
                    markSuccess()
                    break
                    
                case .failure(let error):
                    markFailure(txt: error.localizedDescription)
                    break
                }
            }
    }
    
    func markSuccess() {
        text = "Done!"
        withAnimation(Animation.easeOut(duration: 1)) {
            opacity = 0.0
        }
    }
    
    func markFailure(txt:String) {
        text = "Uh Oh."
        resultText = txt
        withAnimation(Animation.easeOut(duration: 1)) {
            opacity = 0.0
        }
    }
}

struct SubmitView_Previews: PreviewProvider {
    static var previews: some View {
        SubmitView() {
            
        }
    }
}
