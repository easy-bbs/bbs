package com.gg.Service.Imp;

import com.gg.Bean.User;
import com.gg.Service.LoginService;
import org.springframework.stereotype.Service;

/**
 * lgg
 * 2019/7/30
 */
@Service("loginService")
public class LoginServiceIml extends IServiceIml<User> implements LoginService {
}
