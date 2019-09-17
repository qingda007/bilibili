package org.lanqiao.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/account")
public class AcountController {
    @RequestMapping("/account")
    public ModelAndView index(){
        ModelAndView mv=new ModelAndView("account");
        return mv;
    }
}