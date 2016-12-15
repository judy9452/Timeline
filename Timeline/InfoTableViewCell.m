//
//  InfoTableViewCell.m
//  Timeline
//
//  Created by juanmao on 16/12/8.
//  Copyright © 2016年 juanmao. All rights reserved.
//

#import "InfoTableViewCell.h"

@interface InfoTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *productImg;
@property (weak, nonatomic) IBOutlet UILabel *statusLab;
@property (weak, nonatomic) IBOutlet UILabel *companyLab;
@property (weak, nonatomic) IBOutlet UILabel *deliveryIdLab;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLab;

@end

@implementation InfoTableViewCell

- (void)setModel:(InfoModel *)model{
    _model = model;
    self.productImg.image  = [UIImage imageNamed:model.prodouctImg];
    self.statusLab.text = model.deliveryStatus;
    self.companyLab.text = model.deliveryCompany;
    self.deliveryIdLab.text = model.deliveryId;
    self.phoneNumLab.text = model.companyPhone;
}

@end
