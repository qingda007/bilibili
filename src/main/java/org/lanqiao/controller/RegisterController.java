package org.lanqiao.controller;







import org.lanqiao.entity.UserInfo;
import org.lanqiao.service.UserInfoService;
import org.lanqiao.util.SmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



@Controller
@RequestMapping("/user")
public class RegisterController {
    @Autowired
    UserInfoService userInfoService;

    //正常访问注册页面
    @RequestMapping("/toRegister")
    public String register() {
        return "register";
    }
    //真正转到注册页面
    @RequestMapping("/doRegister")
    public String register( UserInfo userInfo) {
        userInfoService.registerUser(userInfo);
        return "login";
    }

    @RequestMapping("/toLogin")
    public String login(){
        return "login";
    }


    //表单提交过来的路径
    @RequestMapping("/checkLogin")

    public ModelAndView checkLogin(UserInfo userInfo, HttpServletRequest request){
        //调用service方法
         userInfoService.checkLogin(userInfo.getUserName(), userInfo.getUserPassw());
         userInfo = userInfoService.updateStatus(userInfo.getUserName());
        //若有user则添加到model里并且跳转到成功页面
        if(userInfo != null){
            HttpSession session = request.getSession();
            userInfo.setUserPassw(null);
            session.setAttribute("userInfo", userInfo);
            return new ModelAndView("zhuye");
        }else{
            return new ModelAndView("login");
        }
    }




    /**
     * 后台获得验证码
     */
    @RequestMapping("/getcode")
    @ResponseBody
    public int getcode(String phone,HttpServletRequest request) {
        long l=System.currentTimeMillis();
        int k1=(int) (l%10000);
        String code=String.valueOf(k1);
        //session中保存我后台生成的code,为了将来拿出来与用户提交的进行比较。
//        Subject subject = SecurityUtils.getSubject();
//        Session session = subject.getSession();
        HttpSession session = request.getSession();
        session.setAttribute("autocode",code);
        //成功返回0，失败返回1
        if(phone!=null){
            //把后台生成的code和所发送的手机号传进发送消息类，调用执行。
            SmsService.send(phone,code);
            return 0;
        }else{
            return 1;
        }
    }



    /**
     *判断验证码的正确性
     */
    @RequestMapping("/comparecode")
    @ResponseBody
    public int authorization(String preauthcode,HttpServletRequest request) {
        HttpSession session = request.getSession();
//        Subject subject = SecurityUtils.getSubject();
//        Session session = subject.getSession();
        String autocode= (String) session.getAttribute("autocode");
        //验证码不为空时，到后台进行比较，返回响应码，为1，提示请先获得验证码
        //为2，提示验证码错误
        //为3，验证码正确，无提示
        if(autocode==null){
            return 1;
        }else if(autocode.equals(preauthcode)){
            return 3;
        }else{
            return 2;
        }
    }
}
