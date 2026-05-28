package com.shopmanagement.security.oauth2;

import com.shopmanagement.entity.AuthProvider;
import com.shopmanagement.service.UserService;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;

@Service
public class CustomOidcUserService extends OidcUserService {

    private final UserService userService;

    public CustomOidcUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public OidcUser loadUser(OidcUserRequest request) throws OAuth2AuthenticationException {
        OidcUser oidcUser = super.loadUser(request);
        String registrationId = request.getClientRegistration().getRegistrationId();
        OAuth2UserInfo info = OAuth2UserInfoFactory.getOAuth2UserInfo(registrationId, oidcUser.getAttributes());
        AuthProvider provider = AuthProvider.valueOf(registrationId.toUpperCase());
        userService.findOrCreateOAuth2User(provider, info);
        return oidcUser;
    }
}
