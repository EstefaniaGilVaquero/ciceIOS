//
//  SWCharacters.m
//  AppStarWarsCharacters
//
//  Created by CICE on 28/10/16.
//  Copyright © 2016 CICE. All rights reserved.
//

#import "SWCharacters.h"

@implementation SWCharacters
    
    //Metodo inicializador designado
    - (instancetype)initWithFirstName:(NSString *)pName
                             lastName:(NSString *)pLastName
                                alias:(NSString *)pAlias{
        
        self = [super init];
        if (self){
            self.firstName = pName;
            self.lastName = pLastName;
            self.alias = pAlias;
        }
        return self;
    }
    
    -(NSString *)description{
        return [NSString stringWithFormat:@"Mi nombre es %@ y mi apellido es %@ y soy mas conocido como %@", self.lastName, self.lastName, self.alias];
    }


@end
