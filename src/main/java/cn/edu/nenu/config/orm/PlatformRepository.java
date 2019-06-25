package cn.edu.nenu.config.orm;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.io.Serializable;

/**
 *  PlatformRepository Class
 * @param <T>
 * @param <ID>
 */
@NoRepositoryBean
public interface PlatformRepository<T,ID extends Serializable> extends JpaSpecificationExecutor<T>,PagingAndSortingRepository<T,ID> {
}
