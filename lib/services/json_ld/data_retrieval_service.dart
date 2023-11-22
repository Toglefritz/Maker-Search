import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:flutter/material.dart' as foundation;

import '../programmable_search_engine/models/product.dart';

/// This class contains public static methods used to make REST API calls to endpoints associated with getting
/// information from websites containing JSON-LD objects.
class DataRetrievalService {
  /// Accepts a URL that should contain product information encoded in JSON-LD format (https://schema.org/Product)
  /// conforming to the "Product" type defined by Schema.org. Return a [Product] obtained by extracting and parsing
  /// website contents.
  static Future<Product?> getProductFromWebPage(Uri uri) async {
    Map<String, dynamic>? jsonLdObject = await _extractJsonLdFromWebPage(uri);

    // If JSON-LD data was successfully extracted, parse it into a Product object.
    if(jsonLdObject != null) {
      try {
        Product product = Product.fromJsonLd(jsonLdObject);

        return product;
      } catch(e) {
        rethrow;
      }
    }
    // Otherwise, if the JSON-LD object is null, return null.
    else {
      return null;
    }
  }

  /// Retrieve the HTML content of a web page, represented as a [Document] object, via  GET request to the
  /// provided [url]. If a non-200 response is returned from the GET request, an exception is thrown.
  static Future<Document> _fetchHtmlContent(Uri uri) async {
    final response = await http.get(uri);

    // The websites contents were successfully retrieved.
    if (response.statusCode == 200) {
      // Parse the response body.
      Document document = html_parser.parse(response.body);

      // Return the HTML content of the page.
      return document;
    }
    // An error occurred while attempting to get the website contents.
    else {
      throw Exception('Failed to load web page with status, ${response.statusCode}');
    }
  }

  /// Fetches a website's content and extracts the JSON-LD object.
  static Future<Map<String, dynamic>?> _extractJsonLdFromWebPage(Uri uri) async {
    try {
      // Fetch the web page content.
      Document document = await _fetchHtmlContent(uri);

      // Find all script tags with the application/ld+json type.
      List<Element> jsonLdScripts = document.querySelectorAll('script[type="application/ld+json"]');

      // The website might contain several JSON-LD scripts an we are only interested in the "Product"
      // type right now. So we will find the first JSON-LD object with this type.
      for(Element script in jsonLdScripts) {
        // Try to decode the JSON-LD content.
        try {
          dynamic jsonLdData = json.decode(script.innerHtml);

          // Check if the JSON-LD content is of type, "Product".
          if(jsonLdData['@type'] == 'Product') {
            return jsonLdData;
          }
        } catch(e) {
          foundation.debugPrint('Error decoding JSON-LD script with exception, $e');
        }
      }
    }
    catch(e) {
      foundation.debugPrint('Failed to fetch website contents with exception, $e');
    }

    return null;
  }
}