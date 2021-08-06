package ${config.domain}.${config.groupId}.${config.projectName}.${config.jwt};

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.stream.Collector;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.fasterxml.jackson.databind.ObjectMapper;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.mainClass};
import ${config.domain}.${config.groupId}.${config.projectName}.${config.common}.${config.securityParams};
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.restFacade}.${config.userService};


public class JWTAuthenticationFilter extends UsernamePasswordAuthenticationFilter {
    private AuthenticationManager authenticationManager;

    public JWTAuthenticationFilter(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }


    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        try {
            ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User myUser = new ObjectMapper().readValue(request.getInputStream(), ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User.class);
            System.out.println(myUser.getUsername());
            System.out.println(myUser.getPassword());
            return authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(myUser.getUsername(),myUser.getPassword()));
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response,
                                            FilterChain chain, Authentication authResult) throws IOException, ServletException {
        ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User user = (${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User)authResult.getPrincipal();

        ${config.userService} userService = ${config.mainClass}.getCtx().getBean(${config.userService}.class);

        ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User myUser = userService.findByUsernameWithRoles(user.getUsername());

        Collection<String> roles = new ArrayList<>();
        if (myUser.getAuthorities() != null) {
            myUser.getAuthorities().forEach(a->roles.add(a.getAuthority()));
        }
        Boolean passwordChanged = myUser.isPasswordChanged();
        if (passwordChanged == null) {
            passwordChanged=Boolean.FALSE;
        }

        String jwt= JWT.create()
                .withIssuer(request.getRequestURI())
                .withSubject(user.getUsername())
                .withArrayClaim("roles",roles.toArray(new String[roles.size()]))
                .withExpiresAt(new Date(System.currentTimeMillis()+ ${config.securityParams}.EXPIRATION))
                .withClaim("passwordChanged",passwordChanged)
                .sign(Algorithm.HMAC256(${config.securityParams}.SECRET));
        response.addHeader(${config.securityParams}.JWT_HEADER_NAME,${config.securityParams}.HEADER_PREFIX+jwt);
        System.out.println(jwt);
    }

}
