//
//  ViewController.h
//  SimpleVideoApp
//
//  Created by Newbie on 3/18/15.
//  Copyright (c) 2015 CodeF Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>


@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) NSURL *vURL;
@property (strong, nonatomic) MPMoviePlayerController *vController;
- (IBAction)recordVideoTap:(id)sender;

@end

