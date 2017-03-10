package cn.kitrst.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import cn.kitrst.blog.domain.Article_Tag;

@Component
public class Article_TagDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insert(String articleid, String tagid) {
		jdbcTemplate.update("insert article_tag(articleid, tagid) values(?,?)", articleid, tagid);
	}

	public Article_Tag getATMapperByAId(int id) {
		return jdbcTemplate.queryForObject("select * from article_tag where articleid=?", new RowMapper<Article_Tag>() {

			@Override
			public Article_Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
				Article_Tag at = new Article_Tag();
				at.setId(rs.getInt("id"));
				at.setArticleid(rs.getString("articleid"));
				at.setTagid(rs.getString("tagid"));
				return at;
			}
			
		}, id);
	}
	
	
	public List<String> getTagIdByArticleId(String articleid) {
		
		return jdbcTemplate.query("select tagid from article_tag where articleid=?", new Object[]{articleid}, new RowMapper<String>() {
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("tagid");
			}
			
		});
	}
	
	public List<String> getArticleIdByTagId(String tagid) {
		
		return jdbcTemplate.query("select articleid from article_tag where tagid=?", new Object[]{tagid}, new RowMapper<String>() {
			@Override
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getString("articleid");
			}
			
		});
	}
	
	public Article_Tag getATMapperByTId(int id) {
		return jdbcTemplate.queryForObject("select * from article_tag where tagid=?", new RowMapper<Article_Tag>() {

			@Override
			public Article_Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
				Article_Tag at = new Article_Tag();
				at.setId(rs.getInt("id"));
				at.setArticleid(rs.getString("articleid"));
				at.setTagid(rs.getString("tagid"));
				return at;
			}
		}, id);
	}
	
	public void delMappingByArticleId(String articleid) {
		jdbcTemplate.update("delete from article_tag where articleid=?", articleid);
	}
	
	public void delMappingByTagId(String tagid) {
		jdbcTemplate.update("delete from article_tag where articleid=?", tagid);
	}
}
