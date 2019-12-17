//
//  MapResourcesUseCase.swift
//  GMapsTest
//
//  Created by Daniel Illescas Romero on 17/12/2019.
//  Copyright © 2019 Daniel Illescas Romero. All rights reserved.
//

import Foundation
import Alamofire

protocol MapResourcesUseCase {
	func execute(
		requestValue: MapResourcesUseCaseValue,
		completionHandler: @escaping (Result<MapResource, AFError>) -> Void
	)
}
struct DefaultMapResourcesUseCase {
	
	private let mapResourcesRepository: MapResourcesRepository
	
	init(mapResourcesRepository: MapResourcesRepository) {
		self.mapResourcesRepository = mapResourcesRepository
	}
	
	func execute(
		requestValue: MapResourcesUseCaseValue,
		completionHandler: @escaping (Result<MapResource, AFError>) -> Void
	) {
		mapResourcesRepository.resources(
			mapFrame: requestValue.mapFrame,
			completionHandler: completionHandler
		)
	}
}

struct MapResourcesUseCaseValue {
	let mapFrame: MapFrame
}
