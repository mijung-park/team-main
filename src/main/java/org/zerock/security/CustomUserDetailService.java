package org.zerock.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.user.domain.UserVO;
import org.zerock.user.mapper.UserMapper;

import lombok.Setter;

public class CustomUserDetailService implements UserDetailsService {

	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO vo = mapper.read(username);
		
		if (vo == null) {
			throw new UsernameNotFoundException("사용자를 찾을 수 없습니다. username: " + username);
		}
		
		return new CustomUser(vo);
	}
}
