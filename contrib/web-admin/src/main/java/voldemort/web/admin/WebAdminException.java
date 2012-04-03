package voldemort.web.admin;

/**
 * @author: pbathala
 * @since: 4/3/12
 */
public class WebAdminException extends Exception {

    private static final long serialVersionUID = 1L;

    public WebAdminException(String message, Exception e) {
        super(message, e);
    }

    public WebAdminException(Exception e) {
        super(e);
    }

    public WebAdminException(String message) {
        super(message);
    }
}
