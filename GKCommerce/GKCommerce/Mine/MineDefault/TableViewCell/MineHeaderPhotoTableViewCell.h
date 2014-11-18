//
//  MineHeaderPhotoTableViewCell.h
//  GKCommerce
//
//  Created by 小悟空 on 11/17/14.
//  Copyright (c) 2014 GKCommerce. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MineHeaderPhotoTableViewCell;

@protocol MineHeaderPhotoTableViewCellDelegate <NSObject>

- (void)headerPhoto:(MineHeaderPhotoTableViewCell *)headerPhoto
       didTapSignup:(id)signupButton;
- (void)headerPhoto:(MineHeaderPhotoTableViewCell *)headerPhoto
 didTapAuthenticate:(id)authenticateButton;

@end

@interface MineHeaderPhotoTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *headerPhotoImageView;
@property (strong, nonatomic) id<MineHeaderPhotoTableViewCellDelegate> delegate;
- (IBAction)didTapSignup:(id)sender;
- (IBAction)didTapAuthenticate:(id)sender;
@end
