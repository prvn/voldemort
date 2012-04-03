package voldemort.web.implementations;

import voldemort.cluster.Cluster;
import voldemort.store.StoreDefinition;

import java.util.List;

/**
 * @author: pbathala
 * @since: 4/3/12
 */
public class Site {

    private Cluster cluster;
    private List<StoreDefinition> stores;
    private String[] bootstrapUrls;

    public Cluster getCluster() {
        return cluster;
    }

    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    public List<StoreDefinition> getStores() {
        return stores;
    }

    public void setStores(List<StoreDefinition> stores) {
        this.stores = stores;
    }

    public String[] getBootstrapUrls() {
        return bootstrapUrls;
    }

    public void setBootstrapUrls(String[] bootstrapUrls) {
        this.bootstrapUrls = bootstrapUrls;
    }
}
