// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_diary/models/news_model/news_model/source.dart';
import 'package:my_diary/models/top_news_models/article.dart';

class NewsApi {
  final baseUrl1 =
      "https://newsapi.org/v2/top-headlines/sources?country=us&apiKey=d35ad37eb75143a895adef21b83d2d51";
  final baseUrl2 =
      "https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=d35ad37eb75143a895adef21b83d2d51";

  Future<List<Source>> getNews() async {
    try {
      final response = await http.get(Uri.parse(baseUrl1));
      if (response.statusCode == 200) {
        // Logging the response body for debugging
        log(response.body.toString());
        print(response.body.toString());

        // Parsing the JSON response and converting it into a list of NewsModel objects
        final List<dynamic> responseData =
            json.decode(response.body)['sources'];
        List<Source> newsList =
            responseData.map((json) => Source.fromJson(json)).toList();

        print(newsList.toString());

        return newsList;
      } else {
        // Logging error if the response status code is not 200
        log('Failed to load news');
        throw Exception('Failed to load news');
      }
    } catch (e) {
      // Handling exceptions and throwing them with a message
      throw Exception('Failed to load news: $e');
    }
  }

  Future<List<Article>> getNewsByCategory(String category) async {
    try {
      final String baseUrl = "https://newsapi.org/v2/top-headlines";
      final String apiKey = "d35ad37eb75143a895adef21b83d2d51";
      final String country = "in";
      final int pageSize = 100;

      // Constructing the URL with parameters
      final Uri uri = Uri.parse(
          '$baseUrl?country=$country&pageSize=$pageSize&category=$category&apiKey=$apiKey');

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // Logging the response body for debugging
        log(response.body.toString());
        print(response.body.toString());

        // Parsing the JSON response and converting it into a list of NewsModel objects
        final List<dynamic> responseData =
            json.decode(response.body)['articles'];
        List<Article> newsList =
            responseData.map((json) => Article.fromJson(json)).toList();

        print(newsList.toString());

        return newsList;
      } else {
        // Logging error if the response status code is not 200
        log('Failed to load news');

        throw Exception('Failed to load news');
      }
    } catch (e) {
      // Handling exceptions and throwing them with a message
      throw Exception('Failed to load news: $e');
    }
  }

  // Future<List<Article>> getTopNews() async {
  //   try {
  //     final response = await http.get(Uri.parse(baseUrl2));
  //     if (response.statusCode == 200) {
  //       // Logging the response body for debugging
  //       log(response.body.toString());
  //       print(response.body.toString());

  //       // Parsing the JSON response and converting it into a list of NewsModel objects
  //       final List<dynamic> responseData =
  //           json.decode(response.body)['articles'];
  //       List<Article> newsList =
  //           responseData.map((json) => Article.fromJson(json)).toList();

  //       print(newsList.toString());

  //       return newsList;
  //     } else {
  //       // Logging error if the response status code is not 200
  //       log('Failed to load news');
  //       throw Exception('Failed to load news');
  //     }
  //   } catch (e) {
  //     // Handling exceptions and throwing them with a message
  //     throw Exception('Failed to load news: $e');
  //   }
  // }
}
