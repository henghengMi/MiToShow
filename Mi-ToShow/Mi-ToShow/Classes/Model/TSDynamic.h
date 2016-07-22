//
//  TSDynamic.h
//  Mi-ToShow
//
//  Created by YuanMiaoHeng on 16/7/21.
//  Copyright © 2016年 TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TSUser.h"
#import "TSAction.h"
#import "TSSubfeed.h"
@interface TSDynamic : NSObject


@property(nonatomic, strong) NSArray * commentcount;
@property(nonatomic, assign) BOOL hide;
@property(nonatomic, copy) NSString * timestamp;
@property(nonatomic, copy) NSString * forwardcount;
@property(nonatomic, copy) NSString * praisecount;
@property(nonatomic, copy) NSString * type;
@property(nonatomic, strong) TSAction * action;
@property(nonatomic, copy) NSString * text;
@property(nonatomic, assign) BOOL ispraise;
@property(nonatomic, copy) NSString * feedid_from;
@property(nonatomic, strong) TSUser  * user;
@property(nonatomic, strong) TSSubfeed * subfeed  ;


/**
 hide = 0,
	commentcount = 0,
	timestamp = 1468994194,
	forwardcount = 0,
	praisecount = 0,
	type = 1,
	action = {
	workid = 1607708,
	topicid = 0,
	pngurl = /work/png/1468994194!X3tnSA19HY5G4ySNHkDGJXj5B98hAZnM.png,
	uid = 580298,
	topicworkcount = 0
 },
	text = 九月,
	ispraise = 0,
	feedid = 1707583,
	feedid_from = 0,
	user = {
	role_type = 0,
	headpic = /work/png/1468833157!Fny3Ow0Un7FYK9QLY1XPAcvjpg1CGT54.png,
	uid = 580298,
	nickname = 恒恒好爱婷婷
 }
 }
 
 **/

@end
