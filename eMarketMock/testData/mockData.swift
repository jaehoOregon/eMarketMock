//
//  mockData.swift
//  eMarketMock
//
//  Created by Jaeho Jung on 2022/09/19.
//

import Foundation

struct mockData {
    static let shared = mockData()
    
    private let popular: listSection = {
        .popular([.init(title : "자전거", image : "bycicle"),
                  .init(title : "오토바이/스쿠터", image : "motorbike"),
                  .init(title : "시계", image : "watch"),
                  .init(title : "골프", image : "golf"),
                  .init(title : "스타굿즈", image : "stargoods"),
                  .init(title : "피큐어/인형", image : "doll"),
                  .init(title : "캠핑", image : "camping"),
                  .init(title : "낚시", image : "fishing"),
                  .init(title : "축구", image : "soccer"),
                  .init(title : "등산/클라이밍", image : "climbing"),
                  .init(title : "카메리/DSLR", image : "camera")])
    }()

    private let used: listSection = {
        .used([.init(title : "여성의류", image : "wcloths"),
               .init(title : "남성의류", image : "mcloths"),
               .init(title : "스니커즈", image : "shoes"),
               .init(title : "가방", image : "bags"),
               .init(title : "시계/주얼리", image : "jewels"),
               .init(title : "패션 액세서리", image : "accessary"),
               .init(title : "디지털/가전", image : "digital"),
               .init(title : "스포츠/레져", image : "sports"),
               .init(title : "차량/오토바이", image : "cars"),
               .init(title : "스타굿즈", image : "stargoods"),
               .init(title : "키덜트", image : "kidult"),
               .init(title : "예술/희귀/수집품", image : "arts"),
               .init(title : "음반/악기", image : "records"),
               .init(title : "도서/티켓/문구", image : "books"),
               .init(title : "뷰티/미용", image : "beauty"),
               .init(title : "가구/인테리어", image : "funiture"),
               .init(title : "생활/가공식품", image : "foods"),
               .init(title : "유아동/출산", image : "birth"),
               .init(title : "반려동물용품", image : "pet"),
               .init(title : "기타", image : "others"),
               .init(title : "번개나눔", image : "share"),
               .init(title : "커뮤니티", image : "community")])
    }()
    
    private let life: listSection = {
        .life([.init(title : "지역 서비스", image : "localservice"),
               .init(title : "원룸/함께살아요", image : "rooms"),
               .init(title : "구인구직", image : "jobs"),
               .init(title : "재능", image : "talentshare")])
    }()
    
    var pageData: [listSection] {
        [popular, used, life]
    }
}
