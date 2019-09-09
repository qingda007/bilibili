package org.lanqiao.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by David on 2019/8/24.
 */
@WebFilter(filterName = "TimerFilter",urlPatterns = "/*")
public class TimerFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //请求过程
        System.out.println("timer");
        Long start = System.currentTimeMillis();
        chain.doFilter(req, resp);//servlet
        //响应过程
        Long end = System.currentTimeMillis();
        System.out.println(end - start);

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
