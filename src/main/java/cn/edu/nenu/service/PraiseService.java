package cn.edu.nenu.service;

import cn.edu.nenu.repository.PraiseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by wangh on 2019/6/30.
 */
@Service
public class PraiseService {

    @Autowired
    private PraiseRepository praiseRepository;



}
