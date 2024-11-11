package com.ict.healim.vo;
public class KakaoUserResponse {
	private Long id;
	private Properties properties;
	private String connected_at;
	private Kakao_account kakao_account;

	// getter/setter

	public Long getId() {
		return id;
	}

	public String getConnected_at() {
		return connected_at;
	}

	public Kakao_account getKakao_account() {
		return kakao_account;
	}

	public void setKakao_account(Kakao_account kakao_account) {
		this.kakao_account = kakao_account;
	}

	public void setConnected_at(String connected_at) {
		this.connected_at = connected_at;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public static class Properties {
		private String nickname;
		private String profile_image;

		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		public String getProfile_image() {
			return profile_image;
		}

		public void setProfile_image(String profile_image) {
			this.profile_image = profile_image;
		}

	}

	public static class Kakao_account
	{
		private String email;
		private Profile profile;

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public Profile getProfile() {
			return profile;
		}

		public void setProfile(Profile profile) {
			this.profile = profile;
		}

		public static class Profile {
			
		}

	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return kakao_account.email;
	}

}
