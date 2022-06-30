//
//  CityCovidOverview.swift
//  COVID19
//
//  Created by 최지혁 on 2022/06/30.
//

import Foundation

struct CityCovidOverview: Codable {
    let korea: CovidOverView
    let seoul: CovidOverView
    let busan: CovidOverView
    let daegu: CovidOverView
    let incheon: CovidOverView
    let gwangju: CovidOverView
    let daejeon: CovidOverView
    let ulsan: CovidOverView
    let sejong: CovidOverView
    let gyeonggi: CovidOverView
    let gangwon: CovidOverView
    let chungbuk: CovidOverView
    let chungnam: CovidOverView
    let jeonbuk: CovidOverView
    let jeonnam: CovidOverView
    let gyeongbuk: CovidOverView
    let gyeongnam: CovidOverView
    let jeju: CovidOverView
    let quarantine: CovidOverView

}

struct CovidOverView: Codable {
    let countryNm : String
    let totalCnt : Int
    let recCnt : Int
    let deathCnt : Int
    let isolCnt : Int
    let qurRate : Int
    let incDec : Int
    let incDecK : Int
    let incDecF : Int
}
