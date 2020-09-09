package com.learning.springboot.service;

import java.util.List;

import com.learning.springboot.model.Profile;

public interface ProfileService {

    List<Profile> getAllProfiles();
    List<Profile> searchProfile(String passportNumber);

    List<Profile> getProfileByPassportNUmber(String passportNumber);

    void saveProfile(Profile profile);
}