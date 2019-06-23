package cn.edu.nenu.service;

import cn.edu.nenu.domain.Dict;
import cn.edu.nenu.repository.DictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wangh on 2019/5/10.
 */
@Service
public class DictService {

    @Autowired
    private DictRepository dictRepository;

    /**
     * 根据主键获取实体，常用
     */
    public Dict findOne(Long pkId){
        return dictRepository.findOne(pkId);
    }

    /**
     * 保存一个实体，常用（save有两个功能，增加和修改）
     * @param entity
     * @return
     */
    public Dict save(Dict entity){
        return dictRepository.save(entity);
    }


    /**
     *获取所有实体
     */
    public List<Dict> getAllDict() {
        return (List<Dict>) dictRepository.findAll();
    }



    /**
     * 删除
     * @param pkId
     */
    public void remove(Long pkId){
        dictRepository.delete(pkId);
    }




}
