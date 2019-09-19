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

        boolean flag = false;

        System.out.println("进入了preHandle。。。。。。");
        System.out.println("在这里进行判断是否程序继续进行，或者做其他的操作。。。。。。");
        System.out.println("getServletPath"+request.getServletPath());


        //从session中获取对象
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
        System.out.println("输出对象==========="+userInfo);

        //获取请求资源
        String requestURI = request.getRequestURI();
        System.out.println("requestURI========="+requestURI);


        //我可以在这里写一个判断，分别拦截前后台的登录，路径包含

        //首先不拦截所有的登录和注册
        //判断是前台还是后台
        //后台所有的都拦截
        //前台不拦截指定的访问方法

        //指定前台要拦截的页面
        final String[] IGNORE_URI ={"login","/queryLogin","/toRegister","/getCode","/video/uploadVideo","/video/homeVideo"};

        //不拦截的资源路径
        final String[] PRE_UNIGNORE_URI={
                "bookController/queryByCitizenId",
                "adviceController/queryAdvicePage",
                "affairsTypeController/queryAll",
                "adviceController/queryListByCitizenId",
                "uploadController/video/uploadVideo",
                "uploadController/video/homeVideo"
        };

        //都不拦截的
        String uri = requestURI.substring(requestURI.lastIndexOf("/"));
        if(uri.startsWith("/login") || uri.startsWith("/queryLogin") || uri.startsWith("/toRegister")||uri.startsWith("/getCode")) {
            System.out.println("请求uri是以特定的开头");
            return true;
        }

        //前台拦截
        //跳转指定资源而未登录的
        for (String preURI : PRE_UNIGNORE_URI) {
            //设定前台需要拦截登录的相反结果集
            if(requestURI.contains(preURI)){
                System.out.println("已拦截的页面******************"+preURI);
                flag =true;
            }
        }
        if(flag){
            if(userInfo==null){
                //重定向
                String loginUrl = "/login.jsp";
                System.out.println("重定向========="+request.getContextPath() + loginUrl);
                response.sendRedirect(request.getContextPath() + loginUrl);
                System.out.println("重定向========="+request.getContextPath() + loginUrl);

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
