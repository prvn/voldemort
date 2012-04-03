package voldemort.web.implementations;

/**
 * @author: pbathala
 * @since: 4/3/12
 */
public abstract class AbstractImplementationConfig implements ImplementationConfig {

    /**
     * Defaults implementation to VOLDEMORT for now
     *
     * @return  Name of the implementation
     */
    @Override
    public String getName() {
        return Implementations.VOLDEMORT;
    }

    public abstract void setName(String implementationName);
}
