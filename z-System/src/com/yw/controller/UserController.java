package com.yw.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.yw.model.User;
import com.yw.model.UserException;

@Controller
@RequestMapping("/user")
public class UserController {

	private Map<String,User> users=new HashMap<String,User>();

	public UserController() {
		users.put("qqq",new User("qqq","123","QQQ","qaz"));
		users.put("www",new User("www","123","WWW","qaz"));
		users.put("eee",new User("eee","123","EEE","qaz"));
		users.put("rrr",new User("rrr","123","RRR","qaz"));
	}
//------------------------------------------------------------------------------------------------------------------------	
	@RequestMapping(value="/users",method=RequestMethod.GET)//只有GET方法访问才处理
	public String list(Model model){
		model.addAttribute("users", users);
		return "user/index";		
	}
//---------------------------------------------------------------------------------------------------------------------------	
	//当是GET方法时，访问此代码
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(@ModelAttribute("user")  User user){//开启ModelDriven方法二
		//开启ModelDriven方法一
		//model.addAttribute(new User());
		return "user/add";		//服务器端跳转，找前缀和后缀，显示一个逻辑视图
	}
	
	//在具体添加用户时是POST请求，访问以下代码
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(@Validated User user, BindingResult br,MultipartFile attach,HttpServletRequest req)throws IOException{//服务器端验证,BindingResult一定要紧跟着@Validated，否则报错（中间不能加任何参数）
		if(br.hasErrors()){
			//如果有错直接跳转到add页面
			return "user/add";     
		}
		String realpath=req.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(realpath);
		File f=new File(realpath+"/"+attach.getInputStream());
		//FileUtils.copyInputStreamToFile(attach.getInputStream(),f);    怎么能没有这个方法，太坑了......
		System.out.println(attach.getName()+","+attach.getOriginalFilename()+","+attach.getContentType());//上传了一个commons-logging.jar包，后台打印出attach , commons-logging.jar , application/x-zip-compressed
		users.put(user.getUsername(), user);
		return "redirect:/user/users";     //客户端跳转，地址栏会变。只要是做处理都得这么写，跳转到页面		
	}
//----------------------------------------------------------------------------------------------------------------------	
	@RequestMapping(value="/{username}",method=RequestMethod.GET)
	public String show(@PathVariable String username,Model model){
		model.addAttribute( users.get(username));
		return "user/show"; 
	}
//------------------------------------------------------------------------------------------------------------------------	
	@RequestMapping(value="/{username}/update",method=RequestMethod.GET)
	public String update(@PathVariable String username,Model model){
		model.addAttribute(users.get(username));
		return "user/update";
	}
	
	@RequestMapping(value="/{username}/update",method=RequestMethod.POST)//修改页面时有问题，信息输错不报错，提交直接蹦400页面：Skipping URI variable 'username' since the request contains a bind value with the same name.
	public String update(@Validated User user,@PathVariable String username, BindingResult br){
		if(br.hasErrors()){
			return "user/update";
		}
		users.put(username, user);		
		return "redirect:/user/users";     
	}
//-------------------------------------------------------------------------------------------------------------------	
	@RequestMapping(value="{username}/delete",method=RequestMethod.GET)
	public  String delete(@PathVariable String username){
		users.remove(username);
		return "redirect:/user/users";
	}
//-----------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(String username ,String password, HttpSession session){
		if(!users.containsKey(username))	{
			throw new UserException("用户名不存在");
		}
		User u=users.get(username);
		if(!u.getPassword().equals(password)){
			throw new UserException("用户密码不正确");
		}
		session.setAttribute("loginUser", u);
		return "redirect:/user/users";
	}
//-------------------------------------------------------------------------------------------------------------------------	
/**
 * 局部异常处理，仅能控制这个控制器中的异常，不方便。可在hello-servlet.xml中配置全局异常
 */
 /*	@ExceptionHandler(value={UserException.class})
 	public String hangdlerException(UserException e, HttpServletRequest req){//不是@RequestMapping所以不能用Model model
		req.setAttribute("e", e);
 		return "error";
 		
 	}*/

	
}
