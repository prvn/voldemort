package voldemort.web.model;

import javax.validation.constraints.NotNull;

/**
 * @author pbathala
 *
 */
public class RebalanceModel {

    @NotNull
    private String cluster;

    public String getCluster() {
        return cluster;
    }

    public void setCluster(String cluster) {
        this.cluster = cluster;
    }

}
