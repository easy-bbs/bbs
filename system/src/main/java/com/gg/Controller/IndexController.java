package com.gg.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * lgg
 * 2019/11/20
 */
@Controller
public class IndexController {
    @RequestMapping("/a")
    public String index(){
        return "index";
    }
}
