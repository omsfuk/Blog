package cn.kitrst.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class DBUtil {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public String getUuid() {
		return jdbcTemplate.queryForObject("select uuid()", new RowMapper<String>() {

			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("uuid()");
			}
			
		});
	}
}
