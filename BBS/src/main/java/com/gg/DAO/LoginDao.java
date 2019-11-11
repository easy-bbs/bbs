package com.gg.DAO;

import com.gg.Bean.User;
import org.springframework.stereotype.Repository;

/**
 * lgg
 * 2019/7/30
 */
@Repository("loginDao")
public interface LoginDao extends BaseDao<User>{
}
