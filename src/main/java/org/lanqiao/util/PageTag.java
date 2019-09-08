package org.lanqiao.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 分页标签处理类
 * @author way2a
 *
 */
public class PageTag extends TagSupport{
    private static final long serialVersionUID = 6179314241821348095L;
    
    private int pageNo = 1;
    private int pageSize = 10;
    private int totalRecord ;
    private String url;
    
    @Override
    public int doStartTag() throws JspException {
        if(pageSize <= 0){
            pageSize = 10;
        }
        //计算总的页数
        int pageCount = (totalRecord % pageSize == 0)?(totalRecord / pageSize):(totalRecord / pageSize + 1);
        //设置最多能显示多少个页数按钮
        int maxShowButton = 5;
        
        StringBuilder sb = new StringBuilder();
        //拼接分页样式
        sb.append("<style type=\"text/css\">");
        sb.append(".pagination {clear:both;color:#323232;padding: 10px;float:right;font-size:13px;}");  
        sb.append(".pagination a, .pagination a:link, .pagination a:visited {padding:2px 5px;margin:2px;border:1px solid #b5b5b5;text-decoration:none;color:#006699;}");  
        sb.append(".pagination a:hover, .pagination a:active {background:#fff; text-decoration:none;}");  
        sb.append(".pagination span.current {padding: 2px 5px;margin: 2px;border: 1px solid #b5b5b5;font-weight: bold;background-color: #fdfdfd;box-shadow:1px 4px 6px rgba(0,0,0,0.2) inset;}");  
        sb.append(".pagination span.disabled {padding: 2px 5px;margin: 2px;border: 1px solid #eee; color: #ddd;}");  
        sb.append("</style>\r\n"); 
        
        if(this.totalRecord == 0){
            sb.append("<div style=\"width:100%;text-align:center;display:block;font-size:15px;\" >\r\n");
            sb.append("<Strong>没有可显示的项目</Strong>\r\n");
        }else{
            sb.append("<div class=\"pagination\" >\r\n");
            //对页数进行越界处理
            if(pageNo > pageCount){
                pageNo = pageCount;
            }
            if(pageNo < 1){
                pageNo = 1;
            }
            
            sb.append("<form method=\"post\" action=\"").append(this.url)
                .append("\" name=\"paramForm\">\r\n");
            
            //获取当前页面request里的所有请求参数
            HttpServletRequest request = (HttpServletRequest)this.pageContext.getRequest();
            Enumeration<String> paramNames = request.getParameterNames();
            //遍历枚举里面的参数，与分页有关的直接设置到属性上，其他参数放置到type为hidden的input中
            String name = null;
            String value = null;
            while(paramNames.hasMoreElements()){
                name = paramNames.nextElement();
                value = request.getParameter(name);
                
                if("pageNo".equals(name)){
                    if(value != null && !"".equals(value)){
                        this.pageNo = Integer.parseInt(value);
                    }
                }else {
                    sb.append("<input type=\"hidden\" name=\"").append(name)
                        .append("\" value=\"").append(value).append("\" />\r\n");
                }
            }
            sb.append("<input type=\"hidden\" name=\"").append("pageNo")
                .append("\" value=\"").append(this.pageNo).append("\" />\r\n");
            
            sb.append("</form>\r\n");
            
            sb.append("<a href=\"javascript:turnOverPage(").append(1)
                .append(")\">首页</a>\r\n");
            //当前页面为第一页时不显示上一页
            if(pageNo == 1){
                sb.append("<span class=\"disabled\">上一页</span>\r\n");
            }else {
                sb.append("<a href=\"javascript:turnOverPage(").append(this.pageNo -1)
                    .append(")\" >上一页</a>\r\n");
            }
            
            //设置显示按钮的数量
            int showButton = maxShowButton;
            //当页数不够maxShowButton时
            if(pageCount < maxShowButton){
                showButton = pageCount;
            }
            
            //标识显示的按钮上的开始下标
            int startPageIndex = 1;
            //当页数为第一页或第二页时
            if(this.pageNo ==1 || this.pageNo ==2){
                startPageIndex = 1;
            }else{
                startPageIndex = this.pageNo - 2;
            }
            
            //当页数为倒数第一或第二页时    6 7 8 [9] 10   6 7 8 9 [10]  其他都是从当前页面的前2个开始，展示maxShowButton个.
            //当总页数不足maxShowButton时也适用，因为此时showButton等于pageCount,开始下标一直为1.
            if(this.pageNo == pageCount || this.pageNo == pageCount - 1 ){
                startPageIndex = pageCount - showButton + 1;  
            }
            
            //循环将按钮拼接到HTML上
            for (int i = 0; i < showButton; i++) {
                int pageIndex = startPageIndex++;
                //如果是当前页，则改变样式，不可点击。
                if(pageIndex == this.pageNo){
                    sb.append("<span class=\"current\">").append(pageIndex).append("</span>\r\n");
                }else{
                    sb.append("<a href=\"javascript:turnOverPage(").append(pageIndex).append(")\">").append(pageIndex).append("</a>\r\n");
                }
            }
            //如果到达了最后一页，则下一页按钮不可用
            if(this.pageNo == pageCount){
                sb.append("<span class=\"disabled\">下一页</span>\r\n");
            }else{
                sb.append("<a href=\"javascript:turnOverPage(").append(this.pageNo + 1)
                    .append(")\" >下一页</a>\r\n");
            }
            
            sb.append("<a href=\"javascript:turnOverPage(").append(pageCount)
                .append(")\">末页</a>\r\n");
            //拼接总记录条数和总页数
            sb.append("共<strong>").append(this.totalRecord).append("</strong>条,").append("共<strong>")
                .append(pageCount).append("</strong>页");
            
            sb.append("<script type=\"text/javascript\">\r\n");
            sb.append("function turnOverPage(no){\r\n");
            sb.append("if(no>").append(pageCount).append("){");
            sb.append("no=").append(pageCount).append(";}\r\n");
            sb.append("if(no<1){ no=1;}\r\n");
            sb.append("document.paramForm.pageNo.value=no;\r\n");
            sb.append("document.paramForm.submit();\r\n");
            sb.append("}\r\n");
            sb.append("</script>\r\n");
        }
        sb.append("</div>\r\n");
        
        try {
            this.pageContext.getOut().println(sb.toString());
        } catch (IOException e) {
            throw new JspException(e);
        }
        return 0;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}