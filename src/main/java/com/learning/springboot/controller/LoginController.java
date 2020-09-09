package com.learning.springboot.controller;

import com.learning.springboot.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.learning.springboot.model.Profile;
import com.learning.springboot.model.User;
import com.learning.springboot.service.SecurityService;
import com.learning.springboot.service.UserService;
import com.learning.springboot.validator.UserValidator;

import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @Autowired
    private ProfileService profileService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm,
                               BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(),
                userForm.getPasswordConfirm());

        model.addAttribute("profileSearchForm", new Profile());

        return "welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error",
                    "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message",
                    "You have been logged out successfully.");

        model.addAttribute("profileSearchForm", new Profile());

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        String loggedInUsername = securityService.findLoggedInUsername();
        User user = userService.findByUsername(loggedInUsername);
        model.addAttribute("profileSearchForm", new Profile());

        return "welcome";
    }

    @RequestMapping(value = {"/luis"}, method = RequestMethod.GET)
    public String LuisQNA(Model model) {
        String loggedInUsername = securityService.findLoggedInUsername();
        User user = userService.findByUsername(loggedInUsername);
        model.addAttribute("profileSearchForm", new Profile());

        return "luis";
    }


    @RequestMapping(value = {"/vision"}, method = RequestMethod.GET)
    public String ComputeVision(Model model) {
        String loggedInUsername = securityService.findLoggedInUsername();
        User user = userService.findByUsername(loggedInUsername);

        return "vision";
    }

    @RequestMapping(value = {"/speech-api"}, method = RequestMethod.GET)
    public String SpeechService(Model model) {
        String loggedInUsername = securityService.findLoggedInUsername();
        User user = userService.findByUsername(loggedInUsername);

        return "speech-api";
    }

    @RequestMapping(value = {"/face-recognition"}, method = RequestMethod.GET)
    public String Facerecognition(Model model) {
        String loggedInUsername = securityService.findLoggedInUsername();
        User user = userService.findByUsername(loggedInUsername);

        return "face-recognize";
    }

    @RequestMapping(value = "/searchProfile", method = RequestMethod.POST)
    public String registration(@ModelAttribute("profileSearchForm") Profile profileSearchForm,
                               BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "welcome";
        }

        List<Profile> profilesList = profileService.searchProfile(profileSearchForm.getPassportNumber());
        // model.addAllAttributes(docs);
        //System.out.println(profilesList.get(0).getName());
        model.addAttribute("profilesList", profilesList);

        return "welcome";
    }

}