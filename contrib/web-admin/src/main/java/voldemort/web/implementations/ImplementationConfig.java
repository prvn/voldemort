package voldemort.web.implementations;

/**
 * This interface is designed keeping in mind that
 * this can be extended for multiple implementations
 *
 * @author: pbathala
 * @since: 4/3/12
 */
public interface ImplementationConfig {

    /**
     * Get name of this implementation
     *
     * @return  Name of the current implementation
     */
    public String getName();

    /**
     * Sets name of this implementation
     *
     * @param implementationName    Name of current implementation
     */
    public void setName(String implementationName);

}
