package cn.kitrst.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import cn.kitrst.blog.domain.Tag;

@Component
public class TagDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
		
	public List<Tag> getTags() {
		return jdbcTemplate.query("select * from tags", new RowMapper<Tag>() {
			@Override
			public Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
				Tag tag = new Tag();
				tag.setTagid(rs.getInt("tagid"));
				tag.setName(rs.getString("name"));
				return tag;
			}
		});
	}
	
	public Tag getTagById(int id) {
		return jdbcTemplate.queryForObject("select * from tags where tagid=?", new RowMapper<Tag>() {
			@Override
			public Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
				Tag tag = new Tag();
				tag.setTagid(rs.getInt("tagid"));
				tag.setName(rs.getString("name"));
				return tag;
			}
		}, id);

	}
	
	public int getTagIdByName(String tagname) {
		return jdbcTemplate.queryForObject("select * from tags where name=?", new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("tagid");
			}
		}, tagname);
	}
}
