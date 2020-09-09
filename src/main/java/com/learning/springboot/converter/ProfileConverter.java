package com.learning.springboot.converter;

import com.learning.springboot.dto.ProfileDto;
import com.learning.springboot.model.Profile;

import java.util.stream.Collectors;

public class ProfileConverter {
	public static Profile dtoToEntity(ProfileDto profileDto) {
		Profile profile = new Profile();
		profile.setName(profileDto.getName());
		return profile;
	}
}
