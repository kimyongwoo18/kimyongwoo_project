package com.its.yongwoo.repository;

import com.its.yongwoo.dto.UsersDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersRepository {
    @Autowired
    SqlSessionTemplate sql;
    public void save(UsersDTO usersDTO) {
        sql.insert("users.save", usersDTO);
    }

    public UsersDTO login(UsersDTO usersDTO) {
        return sql.selectOne("users.login", usersDTO);
    }

    public UsersDTO findByEmail(String email) {
        return sql.selectOne("user.findByEmail", email);
    }
}
