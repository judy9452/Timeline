//
//  InfoModel.h
//  Timeline
//
//  Created by juanmao on 16/12/7.
//  Copyright © 2016年 juanmao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject
@property(nonatomic, strong)NSString      *deliveryInfo;
@property(nonatomic, strong)NSString      *deliveryTime;
@property(nonatomic, assign)BOOL          isCurrent;
@end


@interface InfoModel : NSObject
@property(nonatomic, strong)NSString      *prodouctImg;
@property(nonatomic, strong)NSString      *deliveryStatus;
@property(nonatomic, strong)NSString      *deliveryCompany;
@property(nonatomic, strong)NSString      *deliveryId;
@property(nonatomic, strong)NSString      *companyPhone;
@property(nonatomic, strong)NSArray       *itemsArr;
@end
