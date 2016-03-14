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
import LRMobileSDK


public class WebContentLoadFromArticleIdLiferayConnector: WebContentLoadBaseLiferayConnector {

	public let articleId: String?

	public init(articleId: String) {
		self.articleId = articleId

		super.init()
	}


	//MARK: ServerConnector

	override public func validateData() -> ValidationError? {
		let error = super.validateData()

		if error == nil {
			if (articleId ?? "") == "" {
				return ValidationError("webcontentdisplay-screenlet", "undefined-article")
			}
		}

		return error
	}

}


public class Liferay62WebContentLoadFromArticleIdConnector: WebContentLoadFromArticleIdLiferayConnector {

	override internal func doGetJournalArticleWithTemplate(
		templateId: Int64,
		session: LRSession) -> String? {
			let service = LRScreensjournalarticleService_v62(session: session)

			do {
				let result: String?

				result = try service.getJournalArticleContentWithGroupId(groupId!,
					articleId: articleId!,
					ddmTemplateId: templateId,
					locale: NSLocale.currentLocaleString)

				lastError = nil

				return result
			}
			catch let error as NSError {
				lastError = error
			}

			return nil
	}

	override internal func doGetJournalArticle(session: LRSession) -> String? {
		let service = LRJournalArticleService_v62(session: session)

		do {
			let result: String?

			result = try service.getArticleContentWithGroupId(groupId!,
				articleId: articleId!,
				languageId: NSLocale.currentLocaleString,
				themeDisplay: nil)

			lastError = nil

			return result
		}
		catch let error as NSError {
			lastError = error
		}
		
		return nil
	}
	
}


public class Liferay70WebContentLoadFromArticleIdConnector: WebContentLoadFromArticleIdLiferayConnector {

	override internal func doGetJournalArticleWithTemplate(
		templateId: Int64,
		session: LRSession) -> String? {
			let service = LRScreensjournalarticleService_v70(session: session)

			do {
				let result: String?

				result = try service.getJournalArticleContentWithGroupId(groupId!,
					articleId: articleId!,
					ddmTemplateId: templateId,
					locale: NSLocale.currentLocaleString)

				lastError = nil

				return result
			}
			catch let error as NSError {
				lastError = error
			}

			return nil
	}

	override internal func doGetJournalArticle(session: LRSession) -> String? {
		let service = LRJournalArticleService_v7(session: session)

		do {
			let result: String?

			result = try service.getArticleContentWithGroupId(groupId!,
				articleId: articleId!,
				languageId: NSLocale.currentLocaleString,
				themeDisplay: nil)

			lastError = nil

			return result
		}
		catch let error as NSError {
			lastError = error
		}
		
		return nil
	}
	
}

