//
//  Instrument.swift
//  Instruments
//
//  Created by Andreas Lüdemann on 17/09/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import SpriteKit

struct Instrument: Equatable {
    
    enum InstrumentOption: Equatable {
        case guitar
        case bass
        case drums
        case keyboard
        
        var image: UIImage {
            let name: String
            switch self {
            case .guitar: name = "guitar"
            case .bass: name = "bass"
            case .drums: name = "drums"
            case .keyboard: name = "keyboard"
            }
            
            return UIImage(named: name)!
        }
        
        var name: String {
            switch self {
            case .guitar: return "Guitar"
            case .bass: return "Bass"
            case .drums: return "Drums"
            case .keyboard: return "Keyboard"
            }
        }
        
        static let all: [InstrumentOption] = [
            .guitar,
            .bass,
            .drums,
            .keyboard
        ]
    }
    
    enum Effect {
        case fire
        case magic
        case fireflies
        case rain
        case snow
        
        var resourceName: String {
            let caseName = "\(self)"
            
            let secondIndex = caseName.index(after: caseName.startIndex)
            
            let filePrefix = caseName[..<secondIndex].uppercased() + caseName[secondIndex...]
            
            return filePrefix + "Particle"
        }
        
        static let all: [Effect] = [
            .fire,
            .magic,
            .fireflies,
            .rain,
            .snow
        ]

        func makeNode() -> SKNode {
            let node = SKEmitterNode(fileNamed: resourceName)!
            
            if case .fire = self {
                node.run(.repeatForever(.sequence([
                    .run({
                        node.particleBirthRate = 300
                    }),
                    .wait(forDuration: 0.35),
                    .run({
                        node.particleBirthRate = 0
                    }),
                    .wait(forDuration: 0.75)
                    ])))
            }
            
            return node
        }
    }
    
    var description: String
    var instrumentOption: InstrumentOption
    var effects: Set<Effect>
    var numberOfInstruments: Int
}

func ==(_ lhs: Instrument.InstrumentOption, _ rhs: Instrument.InstrumentOption) -> Bool {
    switch (lhs, rhs) {
    case (.guitar, .guitar): return true
    case (.bass, .bass): return true
    case (.drums, .drums): return true
    case (.keyboard, .keyboard): return true
        
    default: return false
    }
}

func ==(_ lhs: Instrument, _ rhs: Instrument) -> Bool {
    return lhs.description == rhs.description &&
        lhs.instrumentOption == rhs.instrumentOption &&
        lhs.effects == rhs.effects &&
        lhs.numberOfInstruments == rhs.numberOfInstruments
}
