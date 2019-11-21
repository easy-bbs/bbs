package com.gg.Controller;

import com.gg.Bean.AcessToken;
import com.gg.Bean.GithubUser;
import com.gg.Util.GithubProvider;
import org.apache.lucene.store.Directory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * lgg
 * 2019/11/15
 */
@Controller
@RequestMapping
public class CallbackController {

    @Autowired
    private GithubProvider provider;

    @RequestMapping("/callback")
    public String callback(@RequestParam("code") String code,
                           @RequestParam("state") String state){

        AcessToken acessToken = new AcessToken();
        acessToken.setCode(code);
        acessToken.setClient_id("49eab1783a14c0153d65");
        acessToken.setClient_secret("4fa39b719151e209d32108e242353bfc0a25fc6a");
        acessToken.setRedirect_uri("http://localhost:8080/dd_war_exploded/callback");
        acessToken.setState(state);
        String accessToken = provider.Token(acessToken);
        GithubUser githubUser = provider.getUser(accessToken);
        System.out.println(githubUser.getName());
        return "index";
    }
}
