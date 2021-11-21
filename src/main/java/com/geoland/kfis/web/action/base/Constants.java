package com.geoland.kfis.web.action.base;

// TODO: Auto-generated Javadoc
/**
 * The Class Constants.
 *
 * @author GEO&LAND
 * @created April 19, 2014 10:57:31 AM
 * @Version 1.0
 */
public final class Constants {
	
	
	/** The Constant WELCOME. */
	public static final String WELCOME = "Welcome";
	
	/** The Constant USER_LOGIN. */
	public static final String USER_LOGIN = "userlogin";
	
	/** The Constant LOGIN. */
	public static final String LOGIN = "Login";
	
	/** The Constant LOGIN_PWD. */
	public static final String LOGIN_PWD = "PwdSave";
	
	/** The Constant AUTHORIZATION_REQUIRED. */
	public static final String AUTHORIZATION_REQUIRED = "authorization_required";
	
	/** The Constant LANGUAGE. */
	public static final String LANGUAGE = "Language";
	
	/** The Constant LOGINPAGE. */
	public static final String LOGINPAGE = "Base.loginPage";
	
	/** The Constant LOGIN_PAGE. */
	public static final String LOGIN_PAGE = "login_page";
	
	/** The Constant HOME. */
	public static final String HOME = "home_page";
	
	
	/** The Constant ERRORS_EXITS. */
	public static final String ERRORS_EXITS = "errors_exits";
	
	/** The Constant WORK_SESSION. */
	public static final String WORK_SESSION = "worksession";

    /**
     * <p> The token representing a "cancel" request. </p>
     */
    public static final String CANCEL = "cancel";

    /**
     * <p> The token representing a "create" task. </p>
     */
    public static final String CREATE = "create";
    
    /** The Constant READ. */
    public static final String READ = "read";

    /**
     * <p> The application scope attribute under which our user database is
     * stored. </p>
     */
    public static final String DATABASE_KEY = "database";
    
    /**
     * <p> The token representing a "edit" task. </p>
     */
    public static final String DELETE = "delete";

    /**
     * <p> The token representing a "edit" task. </p>
     */
    public static final String EDIT = "edit";

    
	/** The Constant TAB_SEARCH. */
	public static final String TAB_SEARCH = "tabs_search";
	
	/** The Constant TAB_FARMER. */
	public static final String TAB_FARMER = "tabs_farmer";
	
	/** The Constant TAB_FARM. */
	public static final String TAB_FARM = "tabs_farm";
	
	/** The Constant TAB_LIVESTOCK. */
	public static final String TAB_LIVESTOCK = "tabs_livestock";
	
	/** The Constant TAB_MACHINERY. */
	public static final String TAB_MACHINERY = "tabs_machinery";
	
	/** The Constant TAB_LANDUNIT. */
	public static final String TAB_LANDUNIT = "tabs_landunit";;
	
	/** The Constant TAB_WORKSESSION. */
	public static final String TAB_WORKSESSION = "tabs_worksession";
	
	/** The Constant MENU_ACTION_SERVICES. */
	public static final String MENU_ACTION_SERVICES = "services";
	
	/** The Constant MENU_ACTION_HOME. */
	public static final String MENU_ACTION_HOME = "home";
	
	/** The Constant ACTIVELAYER_TEXTURA. */
	public static final String ACTIVELAYER_TEXTURA = "kaveko:ttextura";
	
    /**
     * <p> The session scope attribute under which the Subscription object
     * currently selected by our logged-in User is stored. </p>
     */
    public static final String SUBSCRIPTION_KEY = "subscription";

    /**
     * <p> The session scope attribute under which the User object for the
     * currently logged in user is stored. </p>
     */
    public static final String USER_KEY = "user";

    /**
     * <p>The token representing the "Host" property.
     */
    public static final String HOST = "host";


    // ---- Error Messages ----

    /**
     * <p>
     * A static message in case message resource is not loaded.
     * </p>
     */
    public static final String ERROR_MESSAGES_NOT_LOADED =
            "ERROR:  Message resources not loaded -- check servlet container logs for error messages.";

    /**
     * <p>
     * A static message in case database resource is not loaded.
     * <p>
     */
    public static final String ERROR_DATABASE_NOT_LOADED =
            "ERROR:  User database not loaded -- check servlet container logs for error messages.";

    /**
     * <p>
     * A standard key from the message resources file, to test if it is available.
     * <p>
     */
    public static final String ERROR_DATABASE_MISSING = "error.database.missing";

    /**
     * <P>
     * A "magic" username to trigger an ExpiredPasswordException for testing.
     *</p>
     */
    public static final String EXPIRED_PASSWORD_EXCEPTION = "ExpiredPasswordException";

    /**
     * <p>
     * Name of field to associate with authentification errors.
     * <p>
     */
    public static final String PASSWORD_MISMATCH_FIELD = "password";

    // ---- Log Messages ----

    /**
     * <p> Message to log if saving a user fails. </p>
     */
    public static final String LOG_DATABASE_SAVE_ERROR =
            " Unexpected error when saving User: ";

	/** The Constant MENUACTION. */
	public static final String MENUACTION = "menuaction";

	/** The Constant WORKCONTEXT. */
	public static final String WORKCONTEXT = "workcontext";

	/** The Constant CAPTCHA_KEY. */
	public static final String CAPTCHA_KEY = "captcha";

	
}
