//
//  CombineVC.swift
//  tinder_clone
//
//  Created by Felipe on 30/08/21.
//

import UIKit

class CombineVC: UIViewController   {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        self.adicionarCards()
    }
}


extension CombineVC{
    func adicionarCards() {
        
        for item in 1 ... 3 {
            let redView = CombineCardView()
            redView.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32 , height:view.bounds.height * 0.7)
            
            redView.center = view.center
            
        let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(handlerCard))
            
            redView.addGestureRecognizer(gesture)
            view.addSubview(redView)

        }
    }
}
    extension CombineVC {
        @objc func handlerCard (_ gesture: UIPanGestureRecognizer){
            if let card = gesture.view{
                let point = gesture.translation(in: view)
                
                card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
                
                
                let rotationAngle = point.x / view.bounds.width * 0.4
                card.transform = CGAffineTransform(rotationAngle: rotationAngle)
                
                
                if gesture.state == .ended{
                    
                    UIView.animate(withDuration: 0.2){
                        card.center = self.view.center
                        card.transform = .identity
                    }
                    
                }
            }
        
    }
}
