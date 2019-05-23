package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.Dict;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by wangh on 2019/5/10.
 */
//hibernate是对jpa的实现
//springdata jpa是在实现jpa基础之上，封装一些数据库操作，要使用springdata要先引入hibernate
public interface DictRepository extends PlatformRepository<Dict,Long>{

    List<Dict> findAllByOrderBySortAsc();

}
