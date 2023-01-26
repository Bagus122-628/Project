package org.spring.model;

import javax.persistence.Embeddable;

@Embeddable
public class Profile {

	private String first_name;
	private String last_name;
	private String country;
	private String skill;
	private String photo_profile;

	public Profile() {
	}

	public String getFirstName() {
		return first_name;
	}

	public void setFirstName(String firstName) {
		this.first_name = firstName;
	}

	public String getLastName() {
		return last_name;
	}

	public void setLastName(String lastName) {
		this.last_name = lastName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getPhotoProfile() {
		return photo_profile;
	}

	public void setPhotoProfile(String photoProfile) {
		this.photo_profile = photoProfile;
	}

	@Override
	public String toString() {
		return "Profile [first_name=" + first_name + ", last_name=" + last_name + ", country=" + country + ", skill="
				+ skill + ", photo_profile=" + photo_profile + "]";
	}

}
