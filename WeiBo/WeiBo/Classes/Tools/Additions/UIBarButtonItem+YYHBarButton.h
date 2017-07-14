//
//  UIBarButtonItem+YYHBarButton.h
//  17_03_16_Budejie
//
//  Created by 姚懿恒 on 2017/3/18.
//  Copyright © 2017年 姚懿恒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YYHBarButton)
/*
    抽取方法或是添加分类时的思路:
        一般是看外界如何调用, 缺什么方法就补什么方法.
 */

+ (instancetype)barButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage Target:(id)target action:(SEL)action;

+(instancetype)barButtonWithImage:(UIImage *)image hightligtedImage:(UIImage *) highlightedImage Target:(id)target action:(SEL)action;

+(instancetype)backBarButtonWithImage:(UIImage *)image hightligtedImage:(UIImage *) highlightedImage Target:(id)target action:(SEL)action title:(NSString *)title;
@end
