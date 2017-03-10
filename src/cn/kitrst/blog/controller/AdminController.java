package cn.kitrst.blog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.kitrst.blog.dao.ArticleDao;
import cn.kitrst.blog.dao.Article_TagDao;
import cn.kitrst.blog.dao.CommentDao;
import cn.kitrst.blog.dao.DBUtil;
import cn.kitrst.blog.dao.TagDao;
import cn.kitrst.blog.dao.UserDao;
import cn.kitrst.blog.domain.Tag;

@Controller
public class AdminController {

	@Resource
	private DBUtil dbUtil;
	
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
		
		if("admin".equals(password) && "kitrst".equals(username)) {			
			session.setAttribute("login", "kitrst");
			return "redirect:admin/index";
		} else {
			return "redirect:admin";
		}
	}
	
	@RequestMapping("admin/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("admin/new")
	public String write(String title, String cont, String[] tagList, Model model) {
				
		if(title != null && cont != null) {
			String articleid = dbUtil.getUuid();
			articleDao.insert(articleid, title, cont);
			
			if(tagList != null) {
				for(String tagName : tagList) {
					Tag tag = tagDao.getTagIdByName(tagName);
					articleTagDao.insert(articleid, tag.getUuid());
				}
			}
			return "redirect:new";
		}
		
		List<Tag> tags = tagDao.getTags();
		model.addAttribute("tags", tags);
		
		return "new";
	}
	
	@RequestMapping("admin/tags")
	public String tags(String addTagName, String delTagName, Model model) {
		
		if(addTagName != null && !addTagName.equals("")) {
			if(tagDao.getTagIdByName(addTagName) == null) {
				tagDao.addTag(addTagName);
			}
			return "redirect:tags";
		}
		if(delTagName != null && !delTagName.equals("")) {
			if(tagDao.getTagIdByName(delTagName) != null) {
				tagDao.delTag(delTagName);
			}
			return "redirect:tags";
		}
		
		List<Tag> tags = tagDao.getTags();
		model.addAttribute("tags", tags);
		
		return "tags";
	}
	
	@RequestMapping("admin/done")
	public String done() {
		return "done";
	}
	
}
