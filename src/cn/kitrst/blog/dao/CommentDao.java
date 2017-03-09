package cn.kitrst.blog.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import cn.kitrst.blog.domain.Comment;

@Component
public class CommentDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void update(int articleid, String email, String name, String cont) {
		jdbcTemplate.update("insert comments(articleid, email, name, cont, date) values(?,?,?,?,?)", articleid, email,
				name, cont, new Date(System.currentTimeMillis()));
	}
	
	public List<Comment> getCommentByArticleId(int articleid) {
		return jdbcTemplate.query("select * from comments where articleid=?", new Object[]{articleid}, new RowMapper<Comment>() {

			@Override
			public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
				Comment comment = new Comment();
				comment.setCommentid(rs.getInt("commentid"));
				comment.setArticleid(rs.getInt("articleid"));
				comment.setName(rs.getString("name"));
				comment.setEmail(rs.getString("email"));
				comment.setCont(rs.getString("cont"));
				comment.setDate(rs.getDate("date"));
				return comment;
			}
			
		});
	}
}
