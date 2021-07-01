//
//  ViewController.swift
//  CircleBarPRJ
//
//  Created by Rushi Patel on 2021-06-27.
//

import UIKit

class ViewController: UIViewController {
    
    let shape = CAShapeLayer(); //declare shape
    override func viewDidLoad() {
        super.viewDidLoad()
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true);
        let trackS = CAShapeLayer();
        trackS.path = circlePath.cgPath; // declare path
        trackS.lineWidth = 15; //declare thickness of the path
        trackS.fillColor = UIColor.clear.cgColor;
        trackS.strokeColor = UIColor.lightGray.cgColor;
        view.layer.addSublayer(trackS);
        
        shape.path = circlePath.cgPath; // declare path
        shape.lineWidth = 15; //declare thickness of the path
        shape.fillColor = UIColor.clear.cgColor;
        shape.strokeColor = UIColor.purple.cgColor;
        shape.strokeEnd = 0;
        view.layer.addSublayer(shape);
        let Button = UIButton(frame: CGRect(x: 20, y: view.frame.height - 70, width: view.frame.width - 20, height: 50));
        view.addSubview(Button);
        Button.setTitle("Press it", for: .normal);
        Button.backgroundColor = UIColor.green;
        Button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside);
    }

    @objc func didTapButton(){
        let animate = CABasicAnimation(keyPath: "strokeEnd");
        animate.toValue = 1;
        animate.duration = 5;
        animate.isRemovedOnCompletion = false;
        animate.fillMode = .forwards;
        shape.add(animate, forKey: "animate");
        animate.repeatDuration = 5;
    }

}


// Steps to create a Loading Bar or Circle bar that fills with button.
//1) create a circle Path for the circle to rotate into
//2) Describe the arc center means where is the center point for circle and other stuff is easy.
//3) Declare the circle
