//
//  Movie.swift
//  Netflix Core
//
//  Created by 杨程凯 on 2022/7/24.
//
/**
 this is for extracting movie information from the API interface, the data from the json file
 */
import Foundation


// 加上codable, 方便其他的调用
struct TrendingMoviesResponse: Codable {
    let results: [MovieInterface]
}

struct MovieInterface: Codable  {
    let id: Int
    let media_type: String?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double
    let release_date: String?
    let title: String?
    let vote_average: Double
    let vote_count: Int
    
}

/*
 results =     (
             {
         adult = 0;
         "backdrop_path" = "/2u1YBNBlSwvBReyvI7i5z5ykQXP.jpg";
         "genre_ids" =             (
             28,
             53
         );
         id = 725201;
         "media_type" = movie;
         "original_language" = en;
         "original_title" = "The Gray Man";
         overview = "When the CIA's most skilled mercenary known as Court Gentry, aka Sierra Six, accidentally uncovers dark agency secrets, he becomes a primary target and is hunted around the world by psychopathic former colleague Lloyd Hansen and international assassins.";
         popularity = "185.958";
         "poster_path" = "/13r1DFhfL0qufFjXnrvWuh6qKqH.jpg";
         "release_date" = "2022-07-13";
         title = "The Gray Man";
         video = 0;
         "vote_average" = "6.776";
         "vote_count" = 143;
     },
 */
