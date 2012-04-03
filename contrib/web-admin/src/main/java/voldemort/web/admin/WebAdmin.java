package voldemort.web.admin;

import org.apache.log4j.Logger;

import java.io.File;
import java.net.URL;
import java.security.ProtectionDomain;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * @author: pbathala
 * @since: 4/3/12
 */
public class WebAdmin {

    private static final Logger logger = Logger.getLogger(WebAdmin.class);

    private static String webAdminRoot;
    private static Properties properties;
    private static Map<String, String> clusterInfo = new HashMap<String, String>();

    private static WebAdmin instance = null;

    public WebAdmin getInstance() {
        if (instance == null) {
            instance = new WebAdmin();
        }
        return instance;
    }

    public WebAdmin refreshConfigs() {
        instance = null;
        return getInstance();
    }

    private WebAdmin() {
        ProtectionDomain domain = WebAdmin.class.getProtectionDomain();
        URL location = domain.getCodeSource().getLocation();
        webAdminRoot = location.toExternalForm();
        String configDir = webAdminRoot + File.separator + "conf";
        File[] configFiles = new File(configDir).listFiles();
        configureVoldemort(configFiles);
    }

    private void configureVoldemort(File[] configs) {
        logger.info("Initializing Voldemort configurations");

    }
}
