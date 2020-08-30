package com.learning.springboot.controller;

import java.util.List;

import com.learning.springboot.model.Profile;
import com.learning.springboot.service.ProfileService;
import com.learning.springboot.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/profile")
@RestController
public class ProfileController {
    @Autowired
    ProfileService profileService;

    @RequestMapping(Constants.GET_ALL_PROFILE)
    public List<Profile> getAllProfiles() {
        return profileService.getAllProfiles();
    }

    @RequestMapping(Constants.GET_PROFILE_BY_PASSPORTNUMBER)
    public List<Profile> getProfileByPassportNumber(@PathVariable String passportNumber) {
        return profileService.getProfileByPassportNUmber(passportNumber);
    }

    @RequestMapping(value= Constants.SAVE_PROFILE, method= RequestMethod.POST)
    public void saveUser(@RequestBody Profile profile) {
        profileService.saveUser(profile);
    }

}
