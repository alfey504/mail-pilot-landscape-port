// ----------------------------------------
// 03/04/2023

// Author: Abraham Alfred Babu
// Student ID: 301270598


// A mail pilot game ported from portarit to landscape Screen


import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // Instance Variables
    var currentScene: GKScene?
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndLabel: UILabel!
    @IBOutlet weak var RestartButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        presentStartScene()
        CollisionManager.gameViewController = self
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    // hides unecessary ui elements and present the start scene
    func presentStartScene()
    {
        setStarScreenItemsHidden(hidden: false)
        setEndScreenItemsHidden(hidden: true)
        setGameSceneItemsHidden(hidden: true)
        setScene(sceneName: "StartScene")
    }
    
    // hides unecessary ui elements and present the end scene
    func presentEndScene()
    {
        setStarScreenItemsHidden(hidden: true)
        setEndScreenItemsHidden(hidden: false)
        setGameSceneItemsHidden(hidden: true)
        setScene(sceneName: "EndScene")
    }
    
    func initGame(){
        
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
    }
    
    // hides unecessary ui elements and present the game scene
    func presentGameScene(){
        setStarScreenItemsHidden(hidden: true)
        setEndScreenItemsHidden(hidden: true)
        setGameSceneItemsHidden(hidden: false)
        setScene(sceneName: "GameScene")
    }
    
    
    // set views of stater screen hidden not
    func setStarScreenItemsHidden(hidden: Bool){
        StartLabel.isHidden = hidden
        StartButton.isHidden = hidden
    }
    
    // set views of End screen screen hidden or not
    func setEndScreenItemsHidden(hidden: Bool){
        RestartButton.isHidden = hidden
        EndLabel.isHidden = hidden
    }

    // set views of game screen hidden or not
    func setGameSceneItemsHidden(hidden: Bool){
        ScoreLabel.isHidden = hidden
        LivesLabel.isHidden = hidden
    }
    
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        initGame()
        presentGameScene()
    }
    
    @IBAction func RestartButton_Pressed(_ sender: UIButton)
    {
        initGame()
        presentGameScene()
    }
    

}
