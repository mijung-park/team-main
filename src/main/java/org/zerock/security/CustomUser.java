package org.zerock.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.zerock.user.domain.UserVO;

import lombok.Getter;
import lombok.Setter;

public class CustomUser extends User {
	
	@Getter
	@Setter
	private UserVO member;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(UserVO vo) {
		super(vo.getUser_id(), vo.getUser_password(), vo.getAuthList()
				.stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		
		member = vo;
	}

}
