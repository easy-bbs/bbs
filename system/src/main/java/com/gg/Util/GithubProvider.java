package com.gg.Util;

import com.alibaba.fastjson.JSON;
import com.gg.Bean.AcessToken;
import com.gg.Bean.GithubUser;


import okhttp3.*;
import org.springframework.stereotype.Component;




/**
 * lgg
 * 2019/11/20
 */
@Component
public class GithubProvider {
    public String Token(AcessToken acessToken){


        MediaType mediaType = MediaType.get("application/json; charset=utf-8");

        OkHttpClient client = new OkHttpClient();

        RequestBody body = RequestBody.create(mediaType, JSON.toJSONString(acessToken));
        Request request = new Request.Builder()
                .url("https://github.com/login/oauth/access_token")
                .post(body)
                .build();
        try (Response response = client.newCall(request).execute()) {
            String s = response.body().string();
            System.out.println(s);
            return s;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public GithubUser getUser(String accessToken){
        MediaType JSON = MediaType.get("application/json; charset=utf-8");

        OkHttpClient client = new OkHttpClient();

        Request request = new Request.Builder()
                .url("https://api.github.com/user?acess_token="+accessToken)
                .build();
        try (Response response = client.newCall(request).execute()) {
            String s = response.body().string();
            GithubUser githubUser = com.alibaba.fastjson.JSON.parseObject(s,GithubUser.class);
            return githubUser;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
