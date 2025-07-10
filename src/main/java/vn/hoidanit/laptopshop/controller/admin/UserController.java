package vn.hoidanit.laptopshop.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {

    private UserService userService;
    private UploadService uploadService;
    private PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
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
        List<User> chan = this.userService.getAllUser();
        model.addAttribute("users", chan);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    private String getInformationUser(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @RequestMapping("/admin/user/create")
    private String getCreateUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    private String createUser(Model model, @ModelAttribute("newUser") User Chan,
            @RequestParam("loadFile") MultipartFile file) {
        String avatar = this.uploadService.handleSaveUpLoadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(Chan.getPassword());

        Chan.setAvatar(avatar);
        Chan.setPassword(hashPassword);
        Chan.setRole(this.userService.getRoleByName(Chan.getRole().getName()));
        this.userService.handleSaveUser(Chan);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}")
    private String getUpdateUser(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    private String postUpdateUser(Model model, @ModelAttribute("newUser") User Chan) {
        User currentUser = this.userService.getUserById(Chan.getId());
        if (currentUser != null) {
            currentUser.setAddress(Chan.getAddress());
            currentUser.setFullName(Chan.getFullName());
            currentUser.setPhone(Chan.getPhone());

            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    private String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    private String postDeleteUser(Model model, @ModelAttribute("newUser") User Chan) {
        this.userService.deleteUserById(Chan.getId());
        return "redirect:/admin/user";
    }
}
