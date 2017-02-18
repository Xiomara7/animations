//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0))
containerView.backgroundColor = UIColor.white

let pairBlue = UIColor(red: (80.0/255.0), green: (226.0/255.0), blue: (194.0/255.0), alpha: 1.0)
let appleImage = UIImageView(frame: CGRect(x: 160.0, y: 0.0, width: 50.0, height: 60.0))
    appleImage.image = UIImage(named: "apple")

let circle = UIButton(frame:  CGRect(x: 0.0, y: 0.0, width: 64.0, height: 64.0))
    circle.center = containerView.center
    circle.layer.cornerRadius = 22.0

let startingColor = pairBlue
    circle.backgroundColor = startingColor
    circle.layer.borderWidth = 2.0
    circle.layer.borderColor = pairBlue.cgColor

containerView.addSubview(circle);

UIView.animate(withDuration: 2.0, animations: { () -> Void in
    let endingColor = UIColor.white
    circle.backgroundColor = endingColor
    
    // ROTATE ANIMATION
    let rotate = CGAffineTransform(rotationAngle: 360)
    //circle.transform = rotate
    
    // SCALE ANIMATION
    let scale = CGAffineTransform(scaleX: 5.0, y: 5.0)
    //circle.transform = scale
    
    // ROTATE AND SCALE ANIMATION
    circle.transform = rotate.concatenating(scale)
    
    appleImage.center = containerView.center
    containerView.addSubview(appleImage)
})

PlaygroundPage.current.liveView = containerView

class Responder : NSObject {
    func action() {
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            circle.transform = scaleTransform
            circle.frame.origin.y = 10
            
            appleImage.center = circle.center
        })
    }
}

let responder = Responder()
circle.addTarget(responder, action: #selector(Responder.action), for: .touchUpInside)

