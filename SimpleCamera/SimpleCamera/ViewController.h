//
//  ViewController.h
//  SimpleCamera
//
//  Created by Newbie on 3/11/15.
//  Copyright (c) 2015 CodeF Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)pickFromAlbum:(id)sender;
- (IBAction)pickFromCamera:(id)sender;

@end

