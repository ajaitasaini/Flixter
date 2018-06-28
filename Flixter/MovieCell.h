//
//  MovieCell.h
//  Flixter
//
//  Created by Ajaita Saini on 6/28/18.
//  Copyright © 2018 Ajaita Saini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end
