//
//  ViewController.m
//  App_OBJC_SWIFT_INTEGRAFION
//
//  Created by cice on 5/9/16.
//  Copyright © 2016 Cice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - LIFE VC
- (void)viewDidLoad {
    [super viewDidLoad];
    //Esta es la forma de hacer un print por consola
    NSLog(@"Estamos aqui chicos :)");
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ACTIONS
- (IBAction)showNuevoSaludoOBJC:(id)sender {
    self.MySaludaMundoOBJCLBL.text = @"Hola a todos en OBJC";
}
@end
