package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.User;
import org.springframework.data.jpa.repository.Query;

/**
 * description:
 * user:芋头
 * date:2019/6/22
 * time:16:51
 */
public interface UserRepository  extends PlatformRepository<User,Long> {

   // @Query("select from user u where u.userName = ?1")
    User findByUserName(String username);
}
