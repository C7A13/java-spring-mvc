package vn.hoidanit.laptopshop.controller;

import java.util.List;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    private String getHomePage(Model model) {
        List<User> arrayUser = this.userService.getAllEmailByUser("Chan@gmail.com");
        System.out.println(arrayUser);
        model.addAttribute("chan", "???");
        return "hello";
    }

    @RequestMapping("/admin/user")
    private String pageUser(Model model) {
        List<User> user = this.userService.getAllUser();
        model.addAttribute("users1", user);
        return "admin/user/table-user";
    }

    @RequestMapping("/admin/user/create")
    private String getCreateUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    private String createUser(Model model, @ModelAttribute("newUser") User Chan) {
        this.userService.handleSaveUser(Chan);
        return "redirect:/admin/user";
    }
}
