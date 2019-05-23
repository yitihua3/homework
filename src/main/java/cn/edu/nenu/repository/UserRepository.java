package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.User;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by wangh on 2019/5/10.
 */
public interface UserRepository extends PlatformRepository<User,Long> {

    @Query("select u From User u where u.sex.code = 2 and u.sex.type = 'GB_GENDER'")
    List<User> getUserListForFemale();
}
