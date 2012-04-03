package voldemort.web.implementations;

import java.util.Map;

/**
 * @author: pbathala
 * @since: 4/3/12
 */
public class VoldemortConfig extends AbstractImplementationConfig implements ImplementationConfig {

    private String name;
    private Map<String, Site> site;

    @Override
    public void setName(String implementationName) {
        this.name = implementationName;
    }

    public Map<String, Site> getSite() {
        return site;
    }

    public void setSite(Map<String, Site> site) {
        this.site = site;
    }
}
