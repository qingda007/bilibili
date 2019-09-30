package org.lanqiao.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.entity.UserInfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * 拦截器，用于拦截前台的登录
 * @author connie
 * 要在spring-mvc中配置拦截器<mvc:interceptor>
 *return false表示拦截，不向下执行
 *return true表示放行
 */
public class LoginInterceptor implements HandlerInterceptor  {

    //首先会执行的方法
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {

        boolean flag = false; //是否拦截到需要登录才能访问的页面

        System.out.println("进入了preHandle。。。。。。");
        System.out.println("在这里进行判断是否程序继续进行，或者做其他的操作。。。。。。");
        System.out.println("getServletPath"+request.getServletPath());

        //从session中获取对象
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
        System.out.println("输出对象==========="+userInfo);

        //获取请求资源
        String requestURI = request.getRequestURI();
        System.out.println("requestURI========="+requestURI);

//        //指定前台要拦截的页面
//        final String[] IGNORE_URI ={"login","/queryLogin","/toRegister","/getCode"};

//        //不需要登录也能打开的页面
//        String uri = requestURI.substring(requestURI.lastIndexOf("/"));
//        if(uri.startsWith("/login") || uri.startsWith("/queryLogin") || uri.startsWith("/toRegister")||uri.startsWith("/getCode")) {
//            System.out.println("请求uri是以特定的开头");
//            return true;
//        }

        //需要登录才能打开的页面
        final String[] PRE_UNIGNORE_URI={
                "uploadVideo",
                "homeVideo",
                "managerVideo",
                "modifyVideo",
                "upload",
                "getCover",
                "uploadVideoPic",
                "modifyVideoPic",
                "getAllType1",
                "getType2ByType1",
                "uploadVideoInfo",
                "selectVideo",
                "insertComment",
                "insertDanmu",
                "insertFans",
                "deleteFans"
        };

        //拦截需要登录才可打开的页面
        for (String preURI : PRE_UNIGNORE_URI) {
            if(requestURI.contains(preURI)){
                System.out.println("已拦截的页面******************"+preURI);
                flag =true;
            }
        }
        if(flag){
            if(userInfo==null){
                //重定向
                String loginUrl = "/user/toLogin";
                System.out.println("重定向========="+request.getContextPath() + loginUrl);
                response.sendRedirect(request.getContextPath() + loginUrl);
                return false;
            }
        }
        return true;
    }

    //返回ModelAndView之前执行的方法，面向切面编程中的体现，已经进入了controller
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        System.out.println("进入了postHandle。。。。。。");
    }

    //执行Handle完成之后执行的方法
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        System.out.println("进入了afterHandle。。。。。。");
    }
}
