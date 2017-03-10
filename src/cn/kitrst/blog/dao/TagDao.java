package cn.kitrst.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
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
				tag.setUuid(rs.getString("uuid"));
				tag.setName(rs.getString("name"));
				tag.setColor(rs.getInt("color"));
				return tag;
			}
		});
	}
	
	public Tag getTagByUuid(String uuid) {
		return jdbcTemplate.queryForObject("select * from tags where uuid=?", new RowMapper<Tag>() {
			@Override
			public Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
				Tag tag = new Tag();
				tag.setUuid(rs.getString("uuid"));
				tag.setName(rs.getString("name"));
				tag.setColor(rs.getInt("color"));
				return tag;
			}
		}, uuid);

	}
	
	public Tag getTagIdByName(String tagname) {
		Tag tag = null;
		try {
			tag = jdbcTemplate.queryForObject("select * from tags where name=?", new RowMapper<Tag>() {
				@Override
				public Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
					Tag tag = new Tag();
					tag.setUuid(rs.getString("uuid"));
					tag.setName(rs.getString("name"));
					tag.setColor(rs.getInt("color"));
					return tag;
				}
			}, tagname);
		} catch (EmptyResultDataAccessException e) {
		}
		return tag;
	}
	
	public void addTag(String tagName) {
		jdbcTemplate.update("insert tags(uuid, name, color) values(uuid(),?,?)", tagName, Math.round(Math.random() * 5));
	}
	
	public void delTag(String tagName) {
		jdbcTemplate.update("delete from tags where name=?", tagName);
	}
}
