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
#import "SignUpScreenletViewController.h"

@interface SignUpScreenletViewController () <SignUpScreenletDelegate, LoginScreenletDelegate>

@property (weak, nonatomic) IBOutlet SignUpScreenlet *screenlet;

@end

@implementation SignUpScreenletViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.screenlet.delegate = self;
	self.screenlet.autoLoginDelegate = self;
	self.screenlet.anonymousApiUserName = [LiferayServerContext stringPropertyForKey:@"anonymousUsername"];
	self.screenlet.anonymousApiPassword = [LiferayServerContext stringPropertyForKey:@"anonymousPassword"];
}

- (IBAction)credentialsValueChangedAction:(UISwitch *)sender {
	self.screenlet.saveCredentials = [sender isOn];
}

- (IBAction)loginValueChangedAction:(UISwitch *)sender {
	self.screenlet.autoLogin = [sender isOn];
}

#pragma mark SignUpScreenletDelegate

- (void)screenlet:(SignUpScreenlet *)screenlet onSignUpResponseUserAttributes:(NSDictionary<NSString *,id> *)attributes {
	LiferayLog(attributes);
}

- (void)screenlet:(SignUpScreenlet *)screenlet onSignUpError:(NSError *)error {
	LiferayLog(error.debugDescription);
}

#pragma mark LoginScreenletDelegate

- (void)screenlet:(BaseScreenlet *)screenlet onLoginResponseUserAttributes:(NSDictionary<NSString *,id> *)attributes {
	LiferayLog(attributes);
}

- (void)screenlet:(BaseScreenlet *)screenlet onLoginError:(NSError *)error {
	LiferayLog(error.debugDescription);
}

- (void)screenlet:(BaseScreenlet *)screenlet onCredentialsSavedUserAttributes:(NSDictionary<NSString *,id> *)attributes {
	LiferayLog(attributes);
}

- (void)screenlet:(LoginScreenlet *)screenlet onCredentialsLoadedUserAttributes:(NSDictionary<NSString *,id> *)attributes {
	LiferayLog(attributes);
}


@end
