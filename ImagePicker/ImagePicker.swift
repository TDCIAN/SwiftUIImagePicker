//
//  ImagePicker.swift
//  ImagePicker
//
//  Created by 김정민 on 2021/05/20.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary // 카메라, 포토라이브러리, 세이브드포토스앨범 있는데 그 중 포토 라이브버리로
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType // 포토라이브러리로 설정되어 있는 소스타입을 피커의 소스타입으로
        picker.delegate = context.coordinator
        return picker
    }
    
    // ImagePickerCoordinator 클래스와 연결
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePickerCoordinator(image: $image) // $image는 상단의 바인딩 이미지를 의미
    }
    
    // 사용되지 않는다
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var image: UIImage?
    
    init(image: Binding<UIImage?>) {
        _image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = uiImage
        }
    }
}
