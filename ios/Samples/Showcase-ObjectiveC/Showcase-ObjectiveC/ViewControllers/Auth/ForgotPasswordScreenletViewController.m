/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

@import LiferayScreens;
#import "LiferayLogger.h"
#import "ForgotPasswordScreenletViewController.h"

@interface ForgotPasswordScreenletViewController () <ForgotPasswordScreenletDelegate>

@property (weak, nonatomic) IBOutlet ForgotPasswordScreenlet *screenlet;

@end

@implementation ForgotPasswordScreenletViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.screenlet.delegate = self;
}

#pragma mark ForgotPasswordScreenletDelegate

- (void)screenlet:(ForgotPasswordScreenlet *)screenlet onForgotPasswordSent:(BOOL)passwordSent {
	LiferayLog(passwordSent ? @"YES": @"NO");
}

- (void)screenlet:(ForgotPasswordScreenlet *)screenlet onForgotPasswordError:(NSError *)error {
	LiferayLog(error);
}

@end
