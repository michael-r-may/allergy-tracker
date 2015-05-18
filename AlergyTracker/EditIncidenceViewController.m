//
//  EditIncidenceViewController.m
//  AllergyTracker
//
//  Created by Emily Toop on 18/05/2015.
//  Copyright (c) 2015 Radical Robot. All rights reserved.
//

#import "EditIncidenceViewController.h"

#import "UIView+FrameAccessors.h"
#import "DataManager.h"

@interface EditIncidenceViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIDatePicker *incidentTime;
@property (weak, nonatomic) IBOutlet UITextView *notes;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation EditIncidenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.incidentTime.date = self.incidence.time;
    
    self.notes.text = self.incidence.notes;
    self.notes.layer.borderWidth = 1.0f;
    self.notes.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.notes.delegate = self;
    UIToolbar *notesToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    notesToolbar.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *close = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(closeKeyboard:)];
    notesToolbar.items= @[spacer, close];
    self.notes.inputAccessoryView = notesToolbar;
    
    self.scrollView.contentSize = (CGSize){1.0, 1.0};
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (IBAction)save:(id)sender {
    self.incidence.time = self.incidentTime.date;
    self.incidence.notes = self.notes.text;
    
    __weak typeof(self) weakself = self;
    [DataManager saveIncidence:self.incidence withCompletion:^(BOOL success, NSError *error) {
        typeof(self) localself = weakself;
        if(success) {
            [localself.navigationController popViewControllerAnimated:YES];
        }
        else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Problem Saving" message:@"We had a problem saving your changes, please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardWillShow:(NSNotification *)notification {
    // use the keyboard height to set constraint
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = CGRectGetHeight([self.view convertRect:keyboardRect fromView:nil]);
    
    self.scrollView.contentSize = (CGSize){1, self.scrollView.height + keyboardHeight};
    
    [self.scrollView scrollRectToVisible:CGRectMake(0, self.contentView.bottom, self.scrollView.width, (keyboardHeight + 40) - self.notes.height) animated:YES];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, 10, 10) animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.incidence.managedObjectContext refreshObject:self.incidence mergeChanges:NO];
}

- (void)viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillChangeFrameNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
}

-(void)closeKeyboard:(id)sender {
    NSLog(@"Closing keyboard");
    [self.notes resignFirstResponder];
}

#pragma mark - UITextViewDelegate

-(void)textViewDidBeginEditing:(UITextView *)textView {
    
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
}

@end