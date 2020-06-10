//
//  GameViewController.swift
//  ZombieConga1
//
//  Created by Sidharth Nayyar on 6/8/20.
//  Copyright © 2020 Sidharth Nayyar. All rights reserved.
//

import UIKit
import SpriteKit
class GameViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let scene =
        //we can give width and height
      GameScene(size:CGSize(width: 1998, height: 1366))
    let skView = self.view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    skView.ignoresSiblingOrder = true
    scene.scaleMode = .aspectFill
    skView.presentScene(scene)

  }
  override var prefersStatusBarHidden: Bool {
return true
} }
