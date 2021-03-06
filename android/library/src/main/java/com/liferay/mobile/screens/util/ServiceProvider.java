package com.liferay.mobile.screens.util;

import com.liferay.mobile.screens.context.LiferayServerContext;

/**
 * @author Javier Gamarra
 */
public class ServiceProvider {

    private static ServiceVersionFactory versionFactory;

    private ServiceProvider() {
        super();
    }

    public static ServiceVersionFactory getInstance() {
        synchronized (ServiceProvider.class) {
            if (versionFactory == null) {
                versionFactory = createFactory();
            }
        }
        return versionFactory;
    }

    private static ServiceVersionFactory createFactory() {
        try {
            if (!LiferayServerContext.getVersionFactory().isEmpty()) {
                return (ServiceVersionFactory) Class.forName(LiferayServerContext.getVersionFactory()).newInstance();
            }
            if (LiferayServerContext.isLiferay7()) {
                return new ServiceVersionFactory70();
            } else {
                return new ServiceVersionFactory62();
            }
        } catch (Exception e) {
            LiferayLogger.e("Error creating the instance class", e);
            return new ServiceVersionFactory70();
        }
    }
}