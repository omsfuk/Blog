package cn.kitrst.blog.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import cn.kitrst.blog.domain.Article;

@Component
public class ArticleDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insert(String uuid, String title, String cont) {
	    jdbcTemplate.update("insert articles(uuid,title,cont,date) values(?,?,?,?)", uuid, title, cont, new Date(System.currentTimeMillis()));  
	}
	
	public List<Article> getArticles() {
		return jdbcTemplate.query("select * from articles order by date desc", new RowMapper<Article>() {
			@Override
			public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
				Article article = new Article();
				article.setUuid(rs.getString("uuid"));
				article.setTitle(rs.getString("title"));
				article.setCont(rs.getString("cont"));
				article.setDate(rs.getDate("date"));
				return article;
			}
		});
	}
	
	public Article getArticleByUuid(String uuid) {
		return jdbcTemplate.queryForObject("select * from articles where uuid=?", new RowMapper<Article>() {

			@Override
			public Article mapRow(ResultSet rs, int rowNum) throws SQLException {
				Article article = new Article();
				article.setUuid(rs.getString("uuid"));
				article.setTitle(rs.getString("title"));
				article.setCont(rs.getString("cont"));
				article.setDate(rs.getDate("date"));
				return article;
			}
			
		}, uuid);
	}
	
	public int getArticleCount() {
		return jdbcTemplate.queryForObject("select count(*) from articles", new RowMapper<Integer>() {

			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt("count(*)");
			}
			
		});
	}
	
	public void deleteArticleByUuid(String articleid) {
		jdbcTemplate.update("delete from articles where uuid=?", articleid);
	}
	
	public void updateArticle(String uuid, String title, String cont) {
		jdbcTemplate.update("update articles set articles.title=?,articles.cont=? where articles.uuid=?", title, cont, uuid);
	}
}
