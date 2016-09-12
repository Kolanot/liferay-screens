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
import UIKit
import LiferayScreens

public class UserDisplayViewController: UIViewController {

	@IBOutlet weak var userPortraitScreenlet: UserPortraitScreenlet?

	@IBOutlet weak var usernameLabel: UILabel?
	@IBOutlet weak var jobTitleLabel: UILabel?
	@IBOutlet weak var emailLabel: UILabel?
	@IBOutlet weak var nicknameLabel: UILabel!

	public var user: User? {
		didSet {
			userPortraitScreenlet?.load(userId: user!.userId)

			usernameLabel?.text = "\(user!.firstName) \(user!.lastName)"
			jobTitleLabel?.text = user!.jobTitle
			emailLabel?.text = user!.email
			nicknameLabel?.text = user!.screenName
		}
	}
	
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
}