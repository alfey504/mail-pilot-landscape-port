import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    // constructor / initializer
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    // check if the ocean fully moved out of screen
    override func CheckBounds()
    {
        if(position.x <= -2253)
        {
            Reset()
        }
    }
    
    // set the position back to the right side so it can start flowing again
    override func Reset()
    {
        position.x = 2253
    }
    
    // moving the ocean to left of the screen to create the effect of player moving 
    func Move()
    {
        position.x -= verticalSpeed!
    }
}
