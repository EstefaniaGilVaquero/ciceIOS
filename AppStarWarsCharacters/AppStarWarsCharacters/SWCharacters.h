//
//  SWCharacters.h
//  AppStarWarsCharacters
//
//  Created by CICE on 28/10/16.
//  Copyright © 2016 CICE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWCharacters : NSObject
    
    @property (nonatomic, strong) NSString *firstName;
    @property (nonatomic, strong) NSString *lastName;
    @property (nonatomic,strong) NSString *alias;
    
    //Inicializadores designados
    - (instancetype)initWithFirstName:(NSString *)pName
                             lastName:(NSString *)pLastName
                                alias:(NSString *)pAlias;
    
    
    
    

@end
