package com.liferay.mobile.screens.comment.add.interactor;

import com.liferay.mobile.screens.base.interactor.BaseCacheWriteInteractor;
import com.liferay.mobile.screens.comment.CommentEntry;
import com.liferay.mobile.screens.comment.add.CommentAddListener;
import com.liferay.mobile.screens.comment.add.CommentAddScreenlet;
import com.liferay.mobile.screens.comment.display.interactor.CommentEvent;
import com.liferay.mobile.screens.service.v70.CommentmanagerjsonwsService;
import com.liferay.mobile.screens.util.JSONUtil;
import org.json.JSONObject;

/**
 * @author Alejandro Hernández
 */
public class CommentAddInteractor extends BaseCacheWriteInteractor<CommentAddListener, CommentEvent> {

	@Override
	public CommentEvent execute(CommentEvent event) throws Exception {

		String className = event.getClassName();
		long classPK = event.getClassPK();
		String body = event.getBody();

		validate(event.getGroupId(), className, classPK, body);

		CommentmanagerjsonwsService service = new CommentmanagerjsonwsService(getSession());

		JSONObject jsonObject = service.addComment(event.getGroupId(), className, classPK, body);
		CommentEntry commentEntry = new CommentEntry(JSONUtil.toMap(jsonObject));
		return new CommentEvent(commentEntry.getCommentId(), className, classPK, body, commentEntry);
	}

	@Override
	public void onSuccess(CommentEvent event) throws Exception {
		getListener().onAddCommentSuccess(event.getCommentEntry());
	}

	@Override
	protected void onFailure(CommentEvent event) {
		getListener().error(event.getException(), CommentAddScreenlet.DEFAULT_ACTION);
	}

	protected void validate(long groupId, String className, long classPK, String body) {
		if (body.isEmpty()) {
			throw new IllegalArgumentException("comment body cannot be empty");
		} else if (groupId <= 0) {
			throw new IllegalArgumentException("groupId must be greater than 0");
		} else if (className.isEmpty()) {
			throw new IllegalArgumentException("className cannot be empty");
		} else if (classPK <= 0) {
			throw new IllegalArgumentException("classPK must be greater than 0");
		}
	}
}