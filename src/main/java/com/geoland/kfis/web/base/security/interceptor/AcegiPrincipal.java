package com.geoland.kfis.web.base.security.interceptor;

import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Retention;

/**
 * The Interface AcegiPrincipal.
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AcegiPrincipal {
}
