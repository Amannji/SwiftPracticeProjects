//
//  CodeViewModel.swift
//  MindMorph
//
//  Created by Aman Gupta on 18/02/24.
//

import Foundation
import SceneKit

class SceneConfigurator: ObservableObject{
    let scene: SCNScene
    let cameraNode: SCNNode
    init(sceneName: String ){
        self.scene = SCNScene(named: sceneName)!
        self.cameraNode = SCNNode()
    }
    
    
    func start(){
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x:-1,y:2,z:10)
        scene.background.contents = UIColor(.black)
        

        //        if let brainNode = scene.rootNode.childNode(withName: "Brain", recursively: true){
        //            let diffuseMaterial = SCNMaterial()
        //            diffuseMaterial.diffuse.contents = UIColor.red
        //            brainNode.geometry?.materials = [diffuseMaterial]
        //            print("DOne")
        //
        //        }
        applyTextureToAll()
    }
    
    func applyTextureToAll(){
        for childNode in scene.rootNode.childNodes{
            applyTextureToNode(childNode)
        }
    }
    
    func applyTextureToNode(_ node: SCNNode){
        let textureImage = UIImage(named:"BrainDiffuse.png")
        let diffuseMaterial = SCNMaterial()
        diffuseMaterial.diffuse.contents = textureImage
        node.geometry?.materials = [diffuseMaterial]
    }
    
}

class CodeViewModel: ObservableObject{
    

    @Published var blocks:[Action] = []
    var scene = SCNScene(named: "Brain.dae")!
    var cameraNode = SCNNode()
    
    func append(action: Action){
        blocks.append(action)
    }
    
    func remove(index:Int){
        blocks.remove(at: index)
    }
    
}

