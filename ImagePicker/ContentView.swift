//
//  ContentView.swift
//  ImagePicker
//
//  Created by 김정민 on 2021/05/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var showActionSheet = false
    @State var showImagePicker = false
    
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack {
            Button(action: {
                self.showActionSheet = true
            }) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    .foregroundColor(Color.gray)
                
            }.actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("프로필 사진을 선택하세요"), message: nil, buttons: [
                    // Button1 -> 카메라 선택
                    .default(Text("카메라"), action: {
                        self.showImagePicker = true
                        self.sourceType = .camera
                    }),
                    
                    // Button2 -> 사진 라이브러리 선택
                    .default(Text("사진 라이브러리"), action: {
                        self.showImagePicker = true
                        self.sourceType = .photoLibrary
                    }),
                    
                    // Button3 - > 취소 버튼
                    .cancel(Text("취소"))
                ])
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

