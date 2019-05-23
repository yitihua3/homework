package cn.edu.nenu.service;

import cn.edu.nenu.domain.Dict;
import cn.edu.nenu.domain.User;
import cn.edu.nenu.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * UserService Class
 *
 * @author <b>Oxidyc</b>, Copyright &#169; 2003
 * @version 1.0, 2019-03-15 7:55
 */
@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    /**
     * 根据主键获取实体，常用
     */
    public User findOne(Long pkId){
        return userRepository.findOne(pkId);
    }



    public List<User> getAllUser() {
        return (List<User>) userRepository.findAll();
    }

    public User getUser(Long id) {
        return null;
    }

    public Page<User> getEntityPage(Map<String, Object> params, int pageNumber, int pageSize) {
        return null;
    }
}
