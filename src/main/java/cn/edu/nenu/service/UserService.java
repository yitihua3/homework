package cn.edu.nenu.service;

import cn.edu.nenu.config.orm.jpa.DynamicSpecifications;
import cn.edu.nenu.domain.Dict;
import cn.edu.nenu.domain.User;
import cn.edu.nenu.repository.UserRepository;
import com.sun.jndi.toolkit.dir.SearchFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * description:
 * user:芋头
 * date:2019/6/22
 * time:16:49
 */
@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    /**
     *根据id查找用户
     * @param id
     * @return
     */
    public User findUser(Long id){
        return userRepository.findOne(id);
    }

    /**
     * 根据用户名查找用户
     * @param userName
     * @return
     */
    public User findByUserName(String userName){
        return userRepository.findByUserName(userName);
    }


    /**
     * 保存用户
     * @param user
     * @return
     */
    public User save(User user){
        return userRepository.save(user);
    }


    /**
     *获取所有用户
     */
    public List<User> getAllUser() {
        return (List<User>) userRepository.findAll();
    }


    /**
     * 删除用户
     * @param id
     */
    public void remove(Long id){
        userRepository.delete(id);
    }


    /**
     * 根据查询条件获取分页结果数据
     * @param filterParams
     * @param pageNumber
     * @param pageSize
     * @param sortType
     * @return
     */
    public Page<User> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<User> spec = buildSpecification(filterParams);
        return userRepository.findAll(spec,pageRequest);
    }


    /**
     *  创建分页请求
     * @param pageNumber
     * @param pageSize
     * @param sortType
     * @return
     */
    private PageRequest buildPageRequest(int pageNumber, int pageSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "sort");
        } else if ("sort".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "sort");
        }
        return new PageRequest(pageNumber - 1, pageSize, sort);
    }


    /**
     * 创建动态查询条件组合
     * @param filterParams
     * @return
     */
    private Specification<User> buildSpecification(Map<String, Object> filterParams) {

        Map<String, cn.edu.nenu.config.orm.jpa.SearchFilter> filters = cn.edu.nenu.config.orm.jpa.SearchFilter.parse(filterParams);

        Specification<User> spec = DynamicSpecifications.bySearchFilter(filters.values(), User.class);

        return spec;
    }

}
