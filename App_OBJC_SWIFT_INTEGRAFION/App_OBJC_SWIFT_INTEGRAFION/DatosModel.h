//
//  DatosModel.h
//  App_OBJC_SWIFT_INTEGRAFION
//
//  Created by cice on 5/9/16.
//  Copyright © 2016 Cice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatosModel : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *alias;

#pragma mark - Constructor Designado
+(id)datosModelWithFirstName: (NSString *)pFirstName lastName: (NSString *)pLastName alias:(NSString *)pAlias;

#pragma mark - Inicializador designado
-(id)initWhitFirstName: (NSString *)pFirstName lastName: (NSString *)pLastName alias:(NSString *)pAlias;



@end
