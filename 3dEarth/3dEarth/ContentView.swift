//
//  ContentView.swift
//  3dEarth
//
//  Created by Aman Gupta on 25/01/24.
//

import SwiftUI
import SceneKit


struct ContentView: View {
    var scene: SCNScene{
        let scene = SCNScene()
        let earthNode = SCNScene(named:"3dEarth.scnassets/earth1.usdc")?.rootNode
        scene.rootNode.addChildNode(earthNode!)
        return scene
    }
    
    var cameraNode: SCNNode{
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x:0,y:0,z:5)
        return cameraNode
    }
    
    var body: some View {
        SceneView( 
        scene:scene ,
        pointOfView: cameraNode,
        options: []
       )
    }
    
    
}

#Preview {
    ContentView()
}

class EarthScene: SCNScene{
    private var node: SCNNode?
    override init(){
        super.init()
        addBackground()
        addPlanetNode()
        configureCamera()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder: ) has not been implemented")
    }
    
    func configureCamera(){
        self.rootNode.position = SCNVector3(x:0,y:0,z: -8)
        
    }
    func addBackground(){
        background.contents = UIColor.black
    }
    
    func addPlanetNode(){
        
    }
}
