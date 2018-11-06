//
//  RestoreWalletViewController.m
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 28/04/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import libextobjc.EXTScope;
@import UITextView_Placeholder;

#import "RestoreWalletViewController.h"

#import "RestoreWalletViewOutput.h"

#import "NSCharacterSet+WNS.h"

#import "ApplicationConstants.h"

#import "UIColor+Application.h"
#import "UIScreen+ScreenSizeType.h"

@interface RestoreWalletViewController () <UITextViewDelegate>
@property (nonatomic, weak) IBOutlet UIBarButtonItem *nextButton;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextView *mnemonicsTextView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *mnemonicsTextViewHeightConstraint;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *titleTopOffsetConstraint;
@end

@implementation RestoreWalletViewController {
  NSCharacterSet *_separatorCharactorSet;
  CGFloat _keyboardHeight;
}

#pragma mark - LifeCycle

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
  [self.mnemonicsTextView becomeFirstResponder];
}

- (void) viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) viewSafeAreaInsetsDidChange {
  [super viewSafeAreaInsetsDidChange];
  [self _updateScrollViewInsets];
}

#pragma mark - RestoreWalletViewInput

- (void) setupInitialState {
  if ([UIScreen mainScreen].screenSizeType == ScreenSizeTypeInches40) {
    self.mnemonicsTextViewHeightConstraint.constant = 164.0;
    self.titleTopOffsetConstraint.constant = 30.0;
  }
  self.mnemonicsTextView.placeholder = NSLocalizedString(@"Words separated by spaces…", @"Restore wallet. Mnemonics placeholder");
  self.mnemonicsTextView.placeholderColor = [[UIColor lightGreyTextColor] colorWithAlphaComponent:0.5];
  _separatorCharactorSet = [NSCharacterSet whitespaceAndSpaceAndNewlineCharacterSet];
  { //Title label
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 0.0;
    UIFont *font = self.titleLabel.font;
    CGFloat kern = 0.0;
    if ([UIScreen mainScreen].screenSizeType == ScreenSizeTypeInches40) {
      font = [font fontWithSize:36.0];
      style.maximumLineHeight = 36.0;
      style.minimumLineHeight = 36.0;
      kern = 0.0;
    } else {
      style.maximumLineHeight = 40.0;
      style.minimumLineHeight = 40.0;
      kern = -0.3;
    }
    NSDictionary *attributes = @{NSFontAttributeName: font,
                                 NSForegroundColorAttributeName: self.titleLabel.textColor,
                                 NSParagraphStyleAttributeName: style,
                                 NSKernAttributeName: @(kern)};
    self.titleLabel.attributedText = [[NSAttributedString alloc] initWithString:self.titleLabel.text attributes:attributes];
  }
  { //TextView
    self.mnemonicsTextView.textContainerInset = UIEdgeInsetsMake(16.0, 11.0, 11.0, 11.0);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 2.0;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName: style,
                                 NSFontAttributeName: self.mnemonicsTextView.font};
    self.mnemonicsTextView.typingAttributes = attributes;
  }
}

- (void)enableNext:(BOOL)enable {
  self.nextButton.enabled = enable;
}

- (void) presentIncorrectMnemonicsWarning {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Please check your recovery phrase.", @"Restore wallet. Recovery phrase incorrect title")
                                                                 message:NSLocalizedString(@"The recovery phrase you entered doesn't seem to be valid.", @"Restore wallet. Recovery phrase incorrect message")
                                                          preferredStyle:UIAlertControllerStyleAlert];
  @weakify(self);
  [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", @"")
                                            style:UIAlertActionStyleDefault
                                          handler:^(__unused UIAlertAction * _Nonnull action) {
                                            @strongify(self);
                                            [self.mnemonicsTextView becomeFirstResponder];
                                          }]];
  [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - IBActions

- (IBAction) cancelAction:(__unused id)sender {
  [self.output cancelAction];
}

- (IBAction) nextAction:(__unused id)sender {
  [self.output nextAction];
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
  NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
  style.lineSpacing = 2.0;
  NSDictionary *attributes = @{NSParagraphStyleAttributeName: style,
                               NSFontAttributeName: self.mnemonicsTextView.font};
  textView.typingAttributes = attributes;
  NSString *finalText = [textView.text stringByReplacingCharactersInRange:range withString:text];
  NSArray <NSString *> *items = [finalText componentsSeparatedByCharactersInSet:_separatorCharactorSet];
  items = [items filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.length > 0"]];
  return [items count] <= kMnemonicsWordsMaxLength;
}

- (void)textViewDidChange:(UITextView *)textView {
  [self.output textDidChangedAction:textView.text];
}

#pragma mark - Notifications

- (void) keyboardWillShow:(NSNotification *)notification {
  CGSize keyboardSize = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
  _keyboardHeight = keyboardSize.height;
  [self _updateScrollViewInsets];
}

- (void) keyboardWillHide:(__unused NSNotification *)notification {
  _keyboardHeight = 0.0;
  [self _updateScrollViewInsets];
}

#pragma mark - Private

- (void) _updateScrollViewInsets {
  UIEdgeInsets insets;
  if (@available(iOS 11.0, *)) {
    insets = self.scrollView.adjustedContentInset;
  } else {
    insets = self.scrollView.contentInset;
  }
  insets.bottom = _keyboardHeight;
  
  self.scrollView.contentInset = insets;
  
  UIEdgeInsets indicatorInset = self.scrollView.scrollIndicatorInsets;
  indicatorInset.bottom = _keyboardHeight;
  self.scrollView.scrollIndicatorInsets = indicatorInset;
}

@end
