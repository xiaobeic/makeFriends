package com.friends.action;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class MyFilter extends StrutsPrepareAndExecuteFilter{
	public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {  
        HttpServletRequest request = (HttpServletRequest) req;  
        HttpServletResponse response = (HttpServletResponse) res;
        
        //不过滤的url  
        String url = request.getRequestURI();  
        //如果用户访问需要登录的界面将重定向到首页
        if (url.substring(url.length()-2, url.length()).equals("do") && request.getSession().getAttribute("user")==null) {
        	//System.out.println(url);
        	response.sendRedirect("/makeFriends/index.jsp");
        	return;
		}
        //System.out.println(url);  
        if ("/makeFriends/ueditor/jsp/controller.jsp".equals(url)) {  
    	//System.out.println("使用自定义的过滤器");  
            chain.doFilter(req, res);  
        }else{  
        //System.out.println("使用默认的过滤器");  
            super.doFilter(req, res, chain);  
        }  
    }  
}
