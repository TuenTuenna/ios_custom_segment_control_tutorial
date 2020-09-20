//
//  ViewController.swift
//  CustomSegmentControl_Tutorial
//
//  Created by Jeff Jeong on 2020/09/20.
//

import UIKit

class ViewController: UIViewController, MyCustomSegmentControlDelegate {
    
    var myDayArray = ["월", "화", "수", "목", "금"]
    let myDayCharacterArray = ["🐶","🐱","🐭", "🐹", "🦊"]
    
    @IBOutlet weak var whatDayTitle: UILabel!
    
    func segmentValueChanged(to index: Int) {
        print("ViewController - segmentValueChanged() called / index: \(index)")
        self.whatDayTitle.text = myDayArray[index] + "요일\n" + myDayCharacterArray[index]
    }
    

    
    override func loadView() {
        super.loadView()
        print("ViewController - loadView() called")
        let myCustomSegmentControl = MyCustomSegmentControl(frame: CGRect(x: 0, y: 0, width: 200, height: 200), buttonTitles: myDayArray)
        
        myCustomSegmentControl.mySegmentDelegate = self
        
        self.view.addSubview(myCustomSegmentControl)
//        myCustomSegmentControl.backgroundColor = .red
        myCustomSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        myCustomSegmentControl.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myCustomSegmentControl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        myCustomSegmentControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        myCustomSegmentControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    

}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
func updateUIViewController(_ uiViewController: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}
@available(iOS 13.0, *)
struct MyTestViewControllerPreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//            MyTestViewControllerRepresentable()
//                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
        
    }
} #endif

