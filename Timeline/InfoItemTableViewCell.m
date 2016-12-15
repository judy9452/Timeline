//
//  InfoItemTableViewCell.m
//  Timeline
//
//  Created by juanmao on 16/12/8.
//  Copyright © 2016年 juanmao. All rights reserved.
//

#import "InfoItemTableViewCell.h"
@interface InfoItemTableViewCell()
@property(nonatomic, strong)UIView               *timeLineView;
@property(nonatomic, strong)UIImageView          *currentStatusImg;
@property(nonatomic, strong)UITextView           *deliveryStatusStr;
@property(nonatomic, strong)UILabel              *deliveryStatusTime;
@property(nonatomic, strong)UIView               *lineView;
@end

@implementation InfoItemTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self initUIControl];
        
    }
    return self;
}

- (void)initUIControl{
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.timeLineView = [[UIView alloc]init];
    self.timeLineView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.timeLineView];
    
    self.currentStatusImg = [[UIImageView alloc]init];
    self.currentStatusImg.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:self.currentStatusImg];
    
    self.deliveryStatusStr = [[UITextView alloc]init];
    self.deliveryStatusStr.font = [UIFont systemFontOfSize:14];
    self.deliveryStatusStr.editable = NO;
    self.deliveryStatusStr.scrollEnabled = NO;
        ///自动检测字符串中的电话号码，单击可以拨打
    self.deliveryStatusStr.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    self.deliveryStatusStr.textContainerInset  = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.contentView addSubview:self.deliveryStatusStr];
    
    self.deliveryStatusTime = [[UILabel alloc]init];
    self.deliveryStatusTime.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.deliveryStatusTime];
    
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor colorWithRed:230/255 green:231/255 blue:232/255 alpha:1];
    [self.contentView addSubview:self.lineView];

}

- (void)setModel:(ItemModel *)model{
    _model = model;
    if (model.isCurrent) {
        ///最新信息
        self.timeLineView.frame = CGRectMake(32, 15, 1, 100);
        self.currentStatusImg.image = [UIImage imageNamed:@"currentStatus"];
        self.deliveryStatusStr.textColor = self.deliveryStatusTime.textColor = [UIColor greenColor];
    }else{
        self.timeLineView.frame = CGRectMake(32, 0, 1, 100);
        self.currentStatusImg.image = [UIImage imageNamed:@"beforeStatus"];
        
        self.deliveryStatusStr.textColor = self.deliveryStatusTime.textColor = [UIColor darkGrayColor];
    }
    
    self.currentStatusImg.frame = CGRectMake(24, 10, 17, 17);
        ///计算文本高度
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    NSStringDrawingOptions option = (NSStringDrawingOptions)(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading);
    CGSize size = [model.deliveryInfo boundingRectWithSize:CGSizeMake(self.contentView.frame.size.width - 30, MAXFLOAT) options:option attributes:attribute context:nil].size;
    self.deliveryStatusStr.text = _model.deliveryInfo;
    
        ///时间戳转为指定格式时间
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[model.deliveryTime doubleValue]/1000];
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    self.deliveryStatusTime.text = currentDateStr;
    
    self.deliveryStatusStr.frame = CGRectMake(55, 10, self.contentView.frame.size.width-80, ceil(size.height));
    self.deliveryStatusTime.frame = CGRectMake(55, CGRectGetMaxY(self.deliveryStatusStr.bounds)+10, 200, 20);
    self.lineView.frame = CGRectMake(55, 99.5, self.contentView.frame.size.width-40, 0.5);
}
@end
