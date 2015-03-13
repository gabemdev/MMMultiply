//
//  ViewController.m
//  MMMultiplyCalc
//
//  Created by Rockstar. on 3/13/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstValueTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondValueTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *webButton;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (nonatomic) NSInteger result;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webButton.enabled = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)calculate:(NSString *)firstValue and:(NSString *)secondValue {
    NSInteger first = firstValue.integerValue;
    NSInteger second = secondValue.integerValue;

    self.result = first * second;

    BOOL isReultMultipeOfFive = !(self.result % 5);
    if (isReultMultipeOfFive) {
        self.webButton.enabled = YES;
    } else {
        self.webButton.enabled = NO;
    }

    self.title = [NSString stringWithFormat:@"%ld", self.result];


}

#pragma mark - Actions
- (IBAction)onCalculateButtonTapped:(id)sender {
    [self calculate:self.firstValueTextField.text and:self.secondValueTextField.text];

    if ([self.firstValueTextField isFirstResponder] == YES) {
        [self.firstValueTextField resignFirstResponder];
    } else if ([self.secondValueTextField isFirstResponder] == YES) {
        [self.secondValueTextField resignFirstResponder];
    }

}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"showWeb"]) {
        return YES;
    }

    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *webView = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"showWeb"]) {
        webView.resultInt = self.result;
    }


}

@end
