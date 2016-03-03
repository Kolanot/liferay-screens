package com.liferay.mobile.screens.assetlist.connector;

import com.liferay.mobile.android.service.JSONObjectWrapper;
import com.liferay.mobile.android.service.Session;
import com.liferay.mobile.android.v70.screensassetentry.ScreensassetentryService;

/**
 * @author Javier Gamarra
 */
public class ScreensAssetEntryConnector70 implements ScreensAssetEntryConnector {

	public ScreensAssetEntryConnector70(Session session) {
		_screensassetentryService = new ScreensassetentryService(session);
	}

	@Override
	public void getAssetEntries(JSONObjectWrapper entryQuery, String s) throws Exception {
		_screensassetentryService.getAssetEntries(entryQuery, s);
	}

	@Override
	public void getAssetEntries(long companyId, long groupId, String portletItemName, String s, int endRow) throws Exception {
		_screensassetentryService.getAssetEntries(companyId, groupId, portletItemName, s, endRow);
	}

	private final ScreensassetentryService _screensassetentryService;
}