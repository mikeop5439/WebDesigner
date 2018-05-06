package com.webdesign.service.maker.serviceimpl;

import com.webdesign.mapper.maker.MakerMapper;
import com.webdesign.service.maker.service.MakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MakerServiceImpl implements MakerService {
    @Autowired
    private MakerMapper makerMapper;

}
