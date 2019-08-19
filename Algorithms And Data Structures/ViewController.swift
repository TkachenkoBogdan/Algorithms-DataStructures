//
//  ViewController.swift
//  Test
//
//  Created by Богдан Ткаченко on 7/5/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let graph = AdjacencyList<String>()
        
        let a = graph.createVertex(data: "A")
        let b = graph.createVertex(data: "B")
        let c = graph.createVertex(data: "C")
        let d = graph.createVertex(data: "D")
        let e = graph.createVertex(data: "E")
        let f = graph.createVertex(data: "F")
        let g = graph.createVertex(data: "G")
        let h = graph.createVertex(data: "H")
        let i = graph.createVertex(data: "I")
        
        graph.add(.undirected, from: a, to: b, weight: 1)
        graph.add(.undirected, from: b, to: c, weight: 5)
        graph.add(.undirected, from: c, to: f, weight: 20)
        graph.add(.undirected, from: b, to: d, weight: 3)
        graph.add(.undirected, from: d, to: e, weight: 1)
        graph.add(.undirected, from: d, to: h, weight: 2)
        graph.add(.undirected, from: h, to: i, weight: 2)
        graph.add(.undirected, from: i, to: f, weight: 5)
        graph.add(.undirected, from: e, to: f, weight: 3)
        graph.add(.undirected, from: f, to: g, weight: 1)
        
        let dijkstra = Dijkstra(graph: graph)
        let pathsFromA = dijkstra.shortestPath(from: a)
        let path = dijkstra.shortestPath(to: f, paths: pathsFromA)
        
        for edge in path {
            print("\(edge.source) --|\(edge.weight ?? 0.0)|--> \(edge.destination)")
        }
    }

}


