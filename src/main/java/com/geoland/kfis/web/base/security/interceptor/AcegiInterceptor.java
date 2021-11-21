package com.geoland.kfis.web.base.security.interceptor;

import java.lang.reflect.Method;

import org.acegisecurity.Authentication;
import org.acegisecurity.context.SecurityContextHolder;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

// TODO: Auto-generated Javadoc
/**
 * The Class AcegiInterceptor.
 */
public class AcegiInterceptor extends AbstractInterceptor {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	public String intercept(ActionInvocation invocation) throws Exception {

        Object action = invocation.getAction();
        Authentication currentUser = SecurityContextHolder.getContext().getAuthentication();

        if( currentUser!=null ) {
            for( Method m: action.getClass().getDeclaredMethods() ) {
                if( m.getAnnotation(AcegiPrincipal.class)!=null
                        && currentUser.getPrincipal() instanceof PermissionedUser ) {
                    m.invoke(action, currentUser.getPrincipal());
                }
            }
        }

        return invocation.invoke();
    }
}
