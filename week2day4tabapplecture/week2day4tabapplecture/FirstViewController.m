//
//  FirstViewController.m
//  week2day4tabapplecture
//
//  Created by Kyla  on 2018-08-09.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "FirstViewController.h"
#import "Person.h"

@interface FirstViewController () <UITextFieldDelegate>
///////text field
@property (weak, nonatomic) IBOutlet UITextField *textField;
////property person
@property (nonatomic, strong) Person *person;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///initialize the person
    self.person = [[Person alloc] init];
    
    ///////kvo add after person is initialized ----keypath would be the "name" property if you want to observe it///// "|" means bit or
    [self.person addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial) context:nil];
    ////to remove the kvo observer , if you remove multiple times it will crash so only do it once. you can try to use a try catch if you use multiple.////control changes are not apart of KVO////// lots of KVOs for video players when you use them. /////RxSwift is a good reactive framework for swift 
//    [self.person removeObserver:self forKeyPath:@"name"];
    
    
    
    ///and the delegate
    self.textField.delegate = self;
    [self.textField addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventEditingChanged];
    
  
    ////see whats going on in like /////UIKeyboardWilShow to see when the keyboard will show. /////nsnotification centre method 1
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@", note);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        NSLog(@"%@", note);
    }];
}
//////////method for KVO, this observes right away because of initial value
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    /////i only want to hear if this this key is changed
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"%@ - %@", object, change);
    }
}



//////////////////other way
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string {
    NSLog(@"%@", textField.text);
    return YES;
}

-(void)textFieldValueChanged {
    self.person.name = self.textField.text;
    NSLog(@"%@", self.textField.text);
}


- (IBAction)dismissButtonTapped:(id)sender {
    //////dismisses keyboard
    [self.textField resignFirstResponder];
    
    /////own notification without block syntex. user info type and test are just generic ////nsnotification method 2
    [[NSNotificationCenter defaultCenter] postNotificationName:@"test notification key" object:nil  userInfo:@{@"type":@"test"}];
    ///removing/////you should normally removie this in the counterpart
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"test notification key" object:nil];
    ///////when adding observer in view did appear, you would add your remove in view did disappear, put it in the counterpart
}
///own notification without block syntex
-(void)handleNotificaion:(NSNotification *)notification {
    NSLog(@"%@", notification.userInfo);
}

//getting rid of the notification
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
