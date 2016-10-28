//
//  main.m
//  AppStarWarsCharacters
//
//  Created by CICE on 28/10/16.
//  Copyright © 2016 CICE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWCharacters.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //Fase 1
//        SWCharacters *anakin = [[SWCharacters alloc]init];
//        [anakin setFirstName:@"Anakin"];
//        [anakin setLastName:@"DarthVader"];
//        [anakin setAlias:@"DarthVader"];
//        
//        NSLog(@"Mi nombre es %@ y mi apellido es %@ y soy mas conocido como %@", [anakin firstName], [anakin lastName], [anakin alias]);
        
        //Fase 2
        SWCharacters *anakin = [[SWCharacters alloc]initWithFirstName:@"Anakin" lastName:@"Skywalker" alias:@"DarthVader"];
        
        NSLog(@"Mi nombre es %@", anakin);
    }
    return 0;
}
