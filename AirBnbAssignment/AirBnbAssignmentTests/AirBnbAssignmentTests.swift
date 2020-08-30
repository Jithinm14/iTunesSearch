//
//  AirBnbAssignmentTests.swift
//  AirBnbAssignmentTests
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import XCTest
@testable import AirBnbAssignment

class AirBnbAssignmentTests: XCTestCase {
    
    var albumViewModels = [AlbumViewModel]()
    var albumModels = [Album]()
    var albumListViewModel = AlbumListViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        setUpMockAlbum()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //Very basic mock implementation due to time constraints.
    func setUpMockAlbum() {
        self.albumModels = [Album(artistName: "Mumford and Sons", trackName: "Tomkinsons Park", collectionName: "Behind the walls", collectionPrice: 9.0, releaseDate: "2005-09-25T07:00:00Z", artworkUrl100:  "https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/b6/95/64/b6956433-194b-9ec8-661a-66bd3a29eb6c/source/100x100bb.jpg"),
                           Album(artistName: "Kygo", trackName: "Firestone", collectionName: "Kygo greatest", collectionPrice: 8.0, releaseDate: "2016-03-04T08:00:00Z", artworkUrl100: "https://is1-ssl.mzstatic.com/image/thumb/Video113/v4/03/d6/33/03d633e3-26d5-f5a5-3a10-8d337564c112/pr_source.lsr/100x100bb.jpg"),
                           Album(artistName: "Avicii", trackName: "Levels", collectionName: "Top 10", collectionPrice: 10.0, releaseDate: "2007-02-12T08:00:00Z", artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Music4/v4/57/45/86/574586f4-d665-82b6-d31d-e27660af7436/source/100x100bb.jpg")
                       ]
        
        for album in albumModels {
            self.albumViewModels.append(AlbumViewModel(album: album))
        }
        self.albumListViewModel.albums = albumViewModels
    }
    
    func testSortOnTrackName() {
        albumListViewModel.filterOn(.trackName)
        XCTAssertTrue(albumListViewModel.albums[0].trackName == "Firestone")
    }
    
    func testSortOnArtistName() {
        albumListViewModel.filterOn(.artistName)
        XCTAssertTrue(albumListViewModel.albums[0].artistName == "Avicii")
    }
    
    func testSortOnReleaseDate() {
        albumListViewModel.filterOn(.none)
        XCTAssertTrue(albumListViewModel.albums[2].releaseDate == "2005-09-25T07:00:00Z")
    }
    
    func testSortOnCollectionPrice() {
        albumListViewModel.filterOn(.collectionName)
        XCTAssertTrue(albumListViewModel.albums[2].collectionName == "Top 10")
    }
    
    func testSortOnCollectionPriceDecending() {
        albumListViewModel.filterOn(.collectionPriceDescending)
        print("Inside test case : \(albumListViewModel.albums[0].collectionPrice)")
        XCTAssertTrue(albumListViewModel.albums[0].collectionPrice == "10.0")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
