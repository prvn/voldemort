package voldemort.web.server;

import org.apache.log4j.Logger;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.webapp.WebAppContext;

import java.io.File;
import java.net.URL;
import java.security.ProtectionDomain;

/**
 * @author: pbathala
 * @since: 4/3/12
 */
public class WebServer {

    private static final Logger logger = Logger.getLogger(WebServer.class);

    public static void main(String args[]) {
        Server server = new Server(8080);
        ProtectionDomain domain = WebServer.class.getProtectionDomain();
        URL location = domain.getCodeSource().getLocation();
        WebAppContext context = new WebAppContext();
        context.setContextPath("/");
        context.setDescriptor(location.toExternalForm()+"/WEB-INF/web.xml");
        context.setServer(server);
        context.setWar(location.toExternalForm());
        context.setTempDirectory(new File("/tmp/"));

        server.setHandler(context);
        try {
            server.start();
            server.join();
        } catch (InterruptedException e) {
            logger.error(e);
        } catch (Exception e) {
            logger.error(e);
        }
    }
}
