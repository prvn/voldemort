package voldemort.web.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author: pbathala
 * @since: 3/23/12
 */
@Controller
@RequestMapping(value = "/")
public class HomeController {

    private static final Logger logger = Logger.getLogger(HomeController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String showWelcomePage() {
        logger.debug("Returning home page");
        return "welcome";
    }
}
