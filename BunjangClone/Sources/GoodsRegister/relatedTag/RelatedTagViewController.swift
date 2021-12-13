//
//  RelatedTagViewController.swift
//  BunjangClone
//
//  Created by 류창휘 on 2021/12/12.
//

import Foundation
import UIKit
import TagListView
class RelatedTagViewController: BaseViewController, TagListViewDelegate, tagDelegate {
    func changeTagLabel() {
        goodRegisterVC?.relatedTagLabel.text = tagList.joined(separator: ", ")
        goodRegisterVC?.relatedTagLabel.textColor = UIColor.black
    }
    
    
    
    //MARK: - Properties
    @IBOutlet weak var addTagBtn: UIButton!
    @IBOutlet weak var TagTextField: UITextField!
    @IBOutlet weak var tagListView: TagListView!
    
    //태그리스트 담을 배열
    var tagList : [String] = []

    
    // GoodsRegisterViewController
    var goodRegisterVC : GoodsRegisterViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagListView.delegate = self
        
        addTagBtn.addTarget(self, action: #selector(addTags), for: .touchUpInside)
    }
    
    @objc fileprivate func addTags() {
        print("RelatedTagViewController - addTag() called")
        let userInput = TagTextField.text
        if let input = userInput {
            if input.count > 1 {
                tagListView.addTags([input])
                print(userInput!)
                tagList.append(userInput!)
                print(tagList.joined(separator: ", "))
            } else {
                return
            }
        }
    }
    
    
    /// 태그를 눌렀을 때
    /// - Parameters:
    ///   - title: 태그의 타이틀
    ///   - tagView: 해당 태그 뷰
    ///   - sender: 태그 리스트뷰
//    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
//        print("RelatedTagViewController - TagPressed() called / title: \(title)")
//        //해당 태그뷰의 트루 폴스 값을 토글 시켜줌
//        tagView.isSelected.toggle()
//    }
    
    /// 태그 삭제버튼이 클릭 되었을 떄
    /// - Parameters:
    ///   - title: 태그의 타이틀
    ///   - tagView: 해당 태그뷰
    ///   - sender: 태그 리스트뷰
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        sender.removeTagView(tagView)
    }
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        changeTagLabel()
    }
    
}
