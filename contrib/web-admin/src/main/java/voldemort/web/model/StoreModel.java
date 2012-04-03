package voldemort.web.model;

/**
 * @author pbathala
 * @since Jan 18, 2012
 * 
 */
public class StoreModel {
    
    private String name;
    private int replication;
    private String clusterName;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setReplication(int replication) {
        this.replication = replication;
    }

    public int getReplication() {
        return replication;
    }

    public String getClusterName() {
        return clusterName;
    }

    public void setClusterName(String clusterName) {
        this.clusterName = clusterName;
    }

}
