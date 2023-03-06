import GameplayKit
import SpriteKit

class Player : GameObject
{
    // Initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    //check if the player is inside the screen window (playable window)
    override func CheckBounds()
    {
        // constrain the player on the left boundary
        if(position.y <= -320)
        {
            position.y = -320
        }
        
        // constrain the player on the right boundary
        if(position.y >= 320)
        {
            position.y = 320
        }
    }
    
    // set the player to the left of the screen
    override func Reset()
    {
        position.x = -640
    }
    
    func TouchMove(newPos: CGPoint)
    {
        // the plane to positon of touch only in y axis
        position = CGPoint(x: -640, y: newPos.y)
    }
    
}
