//
//  DataService.swift
//  RequestApiDecoder
//
//  Created by Vu on 4/29/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import Foundation
class DataService {
    static let shared: DataService = DataService()
    
    func requestApiEarthQuake(completHander: @escaping([ExtensionEarthQuake.Event]) -> ()) {
        guard  let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson") else { return}
//        guard let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: url) { (data, reponse, err) in
//            guard err == nil else {
//                print(err?.localizedDescription, "Error")
//                return
//            }
            guard let aData = data else { return}
            do {
                let service = try JSONDecoder().decode(EarthQuake.self, from: aData)
                let earthQuake = (ExtensionEarthQuake(service: service))
                DispatchQueue.main.async {
                   completHander(earthQuake.event)
                    
                }
//                print(earthQuake.features)

                
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}
