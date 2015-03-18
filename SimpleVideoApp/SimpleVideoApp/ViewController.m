//
//  ViewController.m
//  SimpleVideoApp
//
//  Created by Newbie on 3/18/15.
//  Copyright (c) 2015 CodeF Team. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)recordVideoTap:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        [self presentViewController:picker animated:YES completion:NULL];
    }
}
    #pragma-mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.vURL = info[UIImagePickerControllerMediaURL];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    self.vController = [[MPMoviePlayerController alloc] init];
    
    [self.vController setContentURL:self.vURL];
    [self.vController.view setFrame:CGRectMake (0, 0, 320, 460)];
    [self.view addSubview:self.vController.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(videoPlayBackFinished:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.vController];
    [self.vController play];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)videoPlayBackFinished:(NSNotification *)notification {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    // Dừng video play và xóa nó khỏi view
    [self.vController stop];
    [self.vController.view removeFromSuperview];
    self.vController = nil;
    
    // Hiện thông báo
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Done" message:@"Video đã phát xong và được gỡ khỏi hệ thống." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
}

@end
