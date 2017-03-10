package cn.kitrst.blog.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.kitrst.blog.dao.ArticleDao;
import cn.kitrst.blog.dao.Article_TagDao;
import cn.kitrst.blog.dao.CommentDao;
import cn.kitrst.blog.dao.TagDao;
import cn.kitrst.blog.dao.UserDao;
import cn.kitrst.blog.domain.Article;
import cn.kitrst.blog.domain.Tag;

@Controller
public class HomeController {
	
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
	
	
	
	@RequestMapping("/tag/{tagid}")
	public String listByTag(@PathVariable String tagid, Model model) {
		
		List<String> articleIds = articleTagDao.getArticleIdByTagId(tagid);
		List<Article> articles = new LinkedList<Article>();
		for(String articleId : articleIds) {
			articles.add(articleDao.getArticleByUuid(articleId));
		}
		for(int i = 0; i < articles.size(); i++) {
			Article article = articles.get(i);
			String cont = article.getCont();
			article.setCont(cont.substring(0, 300 < cont.length() ? 300 : cont.length()).replace("<", "&lt;"));
			
			List<Tag> tags = article.getTags();
			List<String> tagids = articleTagDao.getTagIdByArticleId(article.getUuid());
			for(String tagId : tagids) {
				tags.add(tagDao.getTagByUuid(tagId));
			}
		}
		List<Tag> allTags = tagDao.getTags(); 
		model.addAttribute("articles", articles);
		model.addAttribute("tags", allTags);
		return "home";
	}
	
	@RequestMapping("/article/{articleid}")
	public String article(@PathVariable String articleid, Model model) {
		List<Tag> allTags = tagDao.getTags();
		Article article = articleDao.getArticleByUuid(articleid);
		List<Tag> tags = article.getTags();
		List<String> tagids = articleTagDao.getTagIdByArticleId(article.getUuid());
		for(String tagId : tagids) {
			tags.add(tagDao.getTagByUuid(tagId));
		}
		model.addAttribute("article", article);
		model.addAttribute("tags", allTags);
		return "article";
	}
	
	@RequestMapping("/getArticle")
	public void getArticle(String uuid, HttpServletRequest req, HttpServletResponse resp) {
		Article article = articleDao.getArticleByUuid(uuid);
		
		try {
			resp.getWriter().write(article.getCont());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/about")
	public String about(Model model) {
		List<Tag> tags = tagDao.getTags();
		model.addAttribute("tags", tags);
		return "about";
	}
	@RequestMapping("timeline")
	public String timeline(Model model) {
		List<Article> articles = articleDao.getArticles();
		List<Tag> tags = tagDao.getTags();
		model.addAttribute("articles", articles);
		model.addAttribute("tags", tags);
		return "timeline";
	}
	
	@RequestMapping(value={"/home","/"})
	public String home(Model model) {
		List<Tag> allTags = tagDao.getTags();;
		List<Article> articles = articleDao.getArticles();
		
		for(int i = 0; i < articles.size(); i++) {
			Article article = articles.get(i);
			String cont = article.getCont();
			article.setCont(cont.substring(0, 300 < cont.length() ? 300 : cont.length()).replace("<", "&lt;"));
			
			List<Tag> tags = article.getTags();
			List<String> tagids = articleTagDao.getTagIdByArticleId(article.getUuid());
			for(String tagid : tagids) {
				tags.add(tagDao.getTagByUuid(tagid));
			}
		}
		
		model.addAttribute("articles", articles);
		model.addAttribute("tags", allTags);
		return "home";
	}
}
