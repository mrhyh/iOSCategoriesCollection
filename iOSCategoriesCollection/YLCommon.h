//
//  Common.h
//  iOSCategoriesCollection
//
//  Created by ylgwhyh on 16/3/18.
//  Copyright © 2016年 com.ylgwhyh.iOSCategoriesCollection. All rights reserved.
//

#ifndef YLCommon_h
#define YLCommon_h


#endif /* Common_h */

// RGB颜色设定
#define RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]

//颜色进制转换
#define ColorWithHexString(colorString) [UIColor colorWithHexString:(colorString)]
#define ColorAlphaWithHexString(colorString, a) [UIColor colorWithHexString:(colorString) alpha:a]

//常用颜色
//1.全局用色
#define AppMainStyleColor ColorWithHexString(@"#10aeff") //主色 系统主题色 蓝色
#define SubColor1 ColorWithHexString(@"#d9534f") //辅助色 暗红
#define SubColor2 ColorWithHexString(@"#ffbe00") //辅助色 橘黄

//屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define CONTENT_HEIGHT (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)

//广告栏高度
#define BANNER_HEIGHT 215
#define STYLEPAGE_HEIGHT 21
#define SMALLTV_HEIGHT 77
#define SMALLTV_WIDTH 110
#define FOLLOW_HEIGHT 220
#define SUBCHANNEL_HEIGHT 62


//定义沙盒目录文件的宏
//文件目录(SandBox 简称SB)
#define SBPathTemp       NSTemporaryDirectory()
#define SBPathDocument   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define SBPathCache      [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define SBPathSearch     [SBPathDocument stringByAppendingPathComponent:@"Search.plist"]

#define SBPathMagazine               [SBPathDocument stringByAppendingPathComponent:@"Magazine"]
#define SBPathDownloadedMgzs         [SBPathMagazine stringByAppendingPathComponent:@"DownloadedMgz.plist"]
#define SBPathDownloadURLs           [SBPathMagazine stringByAppendingPathComponent:@"DownloadURLs.plist"]
#define SBPathOperation              [SBPathMagazine stringByAppendingPathComponent:@"Operation.plist"]

#define SBPathSplashScreen           [SBPathCache stringByAppendingPathComponent:@"splashScreen"]

//获取系统时间戳
#define getCurentTime [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]
//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//方正黑体简体字体定义
#define FONT(F) [UIFont fontWithName:@"FZHTJW--GB1-0" size:F]

//角度转弧度
#define DEGREES_TO_RADIANS(d) (d * M_PI / 180)

//系统Notification定义
#define TNCancelFavoriteProductNotification @"TNCancelFavoriteProductNotification"    //取消收藏时
#define TNMarkFavoriteProductNotification   @"TNMarkFavoriteProductNotification"      //标记收藏时

#define kNotficationDownloadProgressChanged @"kNotficationDownloadProgressChanged"  //下载进度变化
#define kNotificationPauseDownload          @"kNotificationPauseDownload"             //暂停下载
#define kNotificationStartDownload          @"kNotificationStartDownload"             //开始下载

#define kNotificationDownloadSuccess        @"kNotificationDownloadSuccess"           //下载成功
#define kNotificationDownloadFailed         @"kNotificationDownloadFailed"            //下载失败
#define kNotificationDownloadNewMagazine    @"kNotificationDownloadNewMagazine"

//接口名称相关

#ifdef DEBUG
//Debug状态下的测试API
#define API_BASE_URL_STRING     @"http://boys.test.companydomain.com/api/"

#else
//Release状态下的线上API
#define API_BASE_URL_STRING     @"http://www.companydomain.com/api/"

#endif

//接口
#define GET_CONTENT_DETAIL      @"channel/getContentDetail" //获取内容详情(含上一个和下一个)
#define GET_COMMENT_LIST        @"comment/getCommentList"   //获取评论列表
#define COMMENT_LOGIN           @"comment/login"            //获取评论列表
#define COMMENT_PUBLISH         @"comment/publish"          //发布评论
#define COMMENT_DELETE          @"comment/delComment"       //删除评论
#define LOGINOUT                @"common/logout"            //登出