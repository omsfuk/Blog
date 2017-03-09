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
	
	
	public void update(int articleid, int tagid) {
		jdbcTemplate.update("insert article_tag(articleid, tagid) values(?,?)", articleid, tagid);
	}

	public Article_Tag getATMapperByAId(int id) {
		return jdbcTemplate.queryForObject("select * from article_tag where articleid=?", new RowMapper<Article_Tag>() {

			@Override
			public Article_Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
				Article_Tag at = new Article_Tag();
				at.setId(rs.getInt("id"));
				at.setArticleid(rs.getInt("articleid"));
				at.setTagid(rs.getInt("commentid"));
				return at;
			}
			
		}, id);
	}
	
	public List<Integer> getTagIdByArticleId(int id) {
		
		return jdbcTemplate.query("select tagid from article_tag where articleid=?", new Object[]{id}, new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("tagid");
			}
			
		});
	}
	
	public List<Integer> getArticleIdByTagId(int id) {
		
		return jdbcTemplate.query("select articleid from article_tag where tagid=?", new Object[]{id}, new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("articleid");
			}
			
		});
	}
	
	public Article_Tag getATMapperByTId(int id) {
		return jdbcTemplate.queryForObject("select * from article_tag where tagid=?", new RowMapper<Article_Tag>() {

			@Override
			public Article_Tag mapRow(ResultSet rs, int rowNum) throws SQLException {
				Article_Tag at = new Article_Tag();
				at.setId(rs.getInt("id"));
				at.setArticleid(rs.getInt("articleid"));
				at.setTagid(rs.getInt("commentid"));
				return at;
			}
		}, id);
	}
	
}
