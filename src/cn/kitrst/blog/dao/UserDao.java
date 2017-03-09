package cn.kitrst.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import cn.kitrst.blog.domain.User;

@Component
public class UserDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public User getUserByName(String username) {
		return jdbcTemplate.queryForObject("select * from users where username=?", new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setNickname(rs.getString("nickname"));
				user.setPassword(rs.getString("password"));
				return user;
			}
		}, username);
	}

	
	
}
