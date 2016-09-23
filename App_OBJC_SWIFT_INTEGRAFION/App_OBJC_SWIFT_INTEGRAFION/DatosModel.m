//
//  DatosModel.m
//  App_OBJC_SWIFT_INTEGRAFION
//
//  Created by cice on 5/9/16.
//  Copyright © 2016 Cice. All rights reserved.
//

#import "DatosModel.h"

@implementation DatosModel

#pragma mark - Constructor Designado
+(id)datosModelWithFirstName: (NSString *)pFirstName lastName: (NSString *)pLastName alias:(NSString *)pAlias{
    return [[self alloc]initWhitFirstName:pFirstName
                                 lastName:pLastName
                                    alias:pAlias];
}

#pragma mark - Inicializador designado
-(id)initWhitFirstName: (NSString *)pFirstName lastName: (NSString *)pLastName alias:(NSString *)pAlias{
    //self = [super init];
    if ([super init]){
        self.firstName = pFirstName;
        self.lastName = pLastName;
        self.alias = pAlias;
        
    }
    return self;
}

#pragma mark - toString (ANDROID)
-(NSString *)description{
    return [NSString stringWithFormat:@"Mi nombre es %@ y mi Apellido es %@ y soy mas conocido como %@", self.firstName,self.lastName,self.alias];
}



@end
