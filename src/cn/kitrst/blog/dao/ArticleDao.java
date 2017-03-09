package cn.kitrst.blog.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import cn.kitrst.blog.domain.Article;

@Component
public class ArticleDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int update(String title, String cont) {
	
	    String sql = "insert articles(userid, title, cont, date) values(?,?,?,?)";  
	    KeyHolder keyHolder = new GeneratedKeyHolder();  
	    jdbcTemplate.update(
	            new PreparedStatementCreator() {  
	                public PreparedStatement createPreparedStatement(Connection con) throws SQLException  
	                {  
	                    PreparedStatement ps = jdbcTemplate.getDataSource()  
	                            .getConnection().prepareStatement(sql, new String[]{"userid", "title", "cont", "date"});
	                    ps.setInt(1, 1);
	                    ps.setString(2, title);  
	                    ps.setString(3, cont);
	                    ps.setDate(4, new Date(System.currentTimeMillis()));
	                    return ps;  
	                }  
	            }, keyHolder);  
	    return keyHolder.getKey().intValue();  
	}
	
	public List<Article> getArticles() {
		return jdbcTemplate.query("select * from articles", new RowMapper<Article>() {
			@Override
			public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
				Article article = new Article();
				article.setArticleid(rs.getInt("articleid"));
				article.setUserid(rs.getInt("userid"));
				article.setTitle(rs.getString("title"));
				article.setCont(rs.getString("cont"));
				article.setDate(rs.getDate("date"));
				return article;
			}
		});
	}
	
	public Article getArticleById(int id) {
		return jdbcTemplate.queryForObject("select * from articles where articleid=?", new RowMapper<Article>() {

			@Override
			public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
				Article article = new Article();
				article.setArticleid(rs.getInt("articleid"));
				article.setTitle(rs.getString("title"));
				article.setCont(rs.getString("cont"));
				article.setDate(rs.getDate("date"));
				return article;
			}
			
		}, id);
	}
}
