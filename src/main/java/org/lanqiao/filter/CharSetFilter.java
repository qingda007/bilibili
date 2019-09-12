package org.lanqiao.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by David on 2019/8/24.
 */
@WebFilter(filterName = "CharSetFilter",urlPatterns = "/*")
public class CharSetFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //1、设置request编码
        System.out.println("char");
        req.setCharacterEncoding("utf-8");
        resp.setContentType("");
        chain.doFilter(req, resp);//servlet
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
