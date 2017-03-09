package cn.kitrst.blog.controller;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.kitrst.blog.dao.ArticleDao;
import cn.kitrst.blog.dao.Article_TagDao;
import cn.kitrst.blog.dao.CommentDao;
import cn.kitrst.blog.dao.TagDao;
import cn.kitrst.blog.dao.UserDao;
import cn.kitrst.blog.domain.Article;
import cn.kitrst.blog.domain.Comment;
import cn.kitrst.blog.domain.Tag;
import cn.kitrst.blog.domain.User;

@Controller
public class LoginController {

	
	@Resource
	private UserDao userDao;
	
	@Resource
	private TagDao tagDao;
	
	@Resource
	private ArticleDao articleDao;
	
	@Resource
	private Article_TagDao articleTagDao;
	
	@Resource
	private CommentDao commentDao;
	
	@RequestMapping("/login")
	public String validate(String username, String password, Model model, HttpSession session) {
		if(username == null || password == null) {
			return "login";
		}
		
		User user = userDao.getUserByName(username);
		if(password.equals(user.getPassword())) {			
			session.setAttribute("user", user);
		}

		return "redirect:index";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/write")
	public String write(String title, String cont, String[] tagList, Model model) {
		List<Tag> tags = tagDao.getTags();
		model.addAttribute("tags", tags);
		if(title != null && cont != null && tagList != null) {
			int articleid = articleDao.update(title, cont);
			for(String tag : tagList) {
				articleTagDao.update(articleid, tagDao.getTagIdByName(tag));
			}
		}
		return "write";
	}
	
	@RequestMapping("/home")
	public String home(Model model) {
		List<Tag> allTags;
		List<Article> articles = articleDao.getArticles();
		for(int i = 0; i < articles.size(); i++) {
			Article article = articles.get(i);
			List<Comment> comments = commentDao.getCommentByArticleId(article.getArticleid());
			article.setCommentCount(comments.size());
			List<Tag> tags = article.getTags();
			List<Integer> tagids = articleTagDao.getTagIdByArticleId(article.getArticleid());
			for(Integer tagid : tagids) {
				tags.add(tagDao.getTagById(tagid));
			}
		}
		allTags = tagDao.getTags();
		model.addAttribute("articles", articles);
		model.addAttribute("tags", allTags);
		return "home1";
	}
	
	@RequestMapping("/tag")
	public String listByTag(int tagId, Model model) {
		List<Tag> allTags;
		List<Integer> articleIds = articleTagDao.getArticleIdByTagId(tagId);
		List<Article> articles = new LinkedList<Article>();
		for(int articleId : articleIds) {
			articles.add(articleDao.getArticleById(articleId));
		}
		for(int i = 0; i < articles.size(); i++) {
			Article article = articles.get(i);
			List<Tag> tags = article.getTags();
			List<Integer> tagids = articleTagDao.getTagIdByArticleId(article.getArticleid());
			for(Integer tagid : tagids) {
				tags.add(tagDao.getTagById(tagid));
			}
		}
		allTags = tagDao.getTags();
		model.addAttribute("articles", articles);
		model.addAttribute("tags", allTags);
		return "home1";
	}
	
	@RequestMapping("/article")
	public String article(int articleid, Model model) {
		Article article = articleDao.getArticleById(articleid);
		List<Comment> comments = commentDao.getCommentByArticleId(articleid);
		model.addAttribute("article", article);
		model.addAttribute("commentsCount", comments.size());
		model.addAttribute("comments", comments);
		return "article";
	}
	
	@RequestMapping("/comment")
	public String article(int articleid, String email, String name, String cont) {
		commentDao.update(articleid, email, name, cont);
		return "redirect:article?articleid=" + articleid;
	}
	
	@RequestMapping("/about")
	public String about(Model model) {
		List<Tag> tags = tagDao.getTags();
		model.addAttribute("tags", tags);
		return "about";
	}
}
