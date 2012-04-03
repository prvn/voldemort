package voldemort.store.stats;

import java.util.HashMap;
import java.util.Map;

/**
 * @author: pbathala
 *
 */
public class StatsRepository {

    private static Map<String, StoreStats> storeStatsMap;

    private static StatsRepository instance = null;

    private StatsRepository() {
        storeStatsMap = new HashMap<String, StoreStats>();
    }

    public static StatsRepository getInstance() {
        if (instance == null) {
            instance = new StatsRepository();
        }
        return instance;
    }

    public void createStats(String storeName, StoreStats stats) {
        storeStatsMap.put(storeName, stats);
    }

    public StoreStats getStats(String storeName) {
        return storeStatsMap.get(storeName);
    }

    protected static StatsRepository resetStats() {
        instance = null;
        return getInstance();
    }
}
