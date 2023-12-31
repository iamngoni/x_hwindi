//
//  x_hwindi
//  application_error
//
//  Created by Ngonidzashe Mangudya on 05/12/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

class ApplicationError implements Exception {
  ApplicationError(
    this.message, {
    this.title = "Hey, it's not your fault",
  });

  factory ApplicationError.unknownError() => ApplicationError(
        'An unknown error occurred',
      );

  final String message;
  final String title;
}
