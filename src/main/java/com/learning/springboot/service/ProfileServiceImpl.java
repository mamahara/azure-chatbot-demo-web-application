package com.learning.springboot.service;

import java.util.List;

import com.learning.springboot.model.Profile;
import com.learning.springboot.repository.ProfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProfileServiceImpl implements ProfileService {

    @Autowired
    private ProfileRepository profileRepository;

    @Override
    public List<Profile> getAllProfiles() {
        return profileRepository.getAllProfiles();
    }

    @Override
    public List<Profile> searchProfile(String passportNumber) {
        return profileRepository.searchProfiles(passportNumber);
    }

    @Override
    public List<Profile> getProfileByPassportNUmber(String passportNumber) {
        return profileRepository.searchProfiles(passportNumber);
    }

    @Override
    public void saveUser(Profile profile) {

    }

}
