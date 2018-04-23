package com.app.framework.auth.shiro;

import com.app.framework.auth.dao.AuthorityDao;
import com.app.framework.auth.dao.RoleDao;
import com.app.framework.auth.dao.UserDao;
import com.app.framework.auth.model.Authority;
import com.app.framework.auth.model.LoginUser;
import com.app.framework.auth.model.Role;
import com.app.framework.core.utils.Status;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Set;
import java.util.stream.Collectors;

/**
 * 注解	说明
 *
 * @RequiresAuthentication 要求当前Subject 已经在当前的session 中被验证通过才能被注解的类/实例/方法访问或调用
 * @RequiresGues 要求当前的Subject 是一个“guest”，也就是他们必须是在之前的session中没有被验证或记住才能被注解的类/实例/方法访问或调用
 * @RequiresPermissions 要求当前的Subject 被允许一个或多个权限，以便执行注解的方法，比如：@RequiresPermissions(“account:create”)
 * @RequiresRoles 要求当前的Subject 拥有所有指定的角色。如果他们没有，则该方法将不会被执行，而且AuthorizationException 异常将会被抛出。比如：@RequiresRoles(“administrator”)
 * @RequiresUser 需要当前的Subject 是一个应用程序用户才能被注解的类/实例/方法访问或调用。要么是通过验证被确认，或者在之前session 中的’RememberMe’服务被记住
 */
@Component
public class UserRealm extends AuthorizingRealm {
    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private AuthorityDao authorityDao;


    @Value("${shiro.need-role:true}")
    private boolean isNeedRole;

    @Value("${shiro.need-permission:true}")
    private boolean isNeedPermission;


    @Override
    public void setCredentialsMatcher(CredentialsMatcher credentialsMatcher) {
        super.setCredentialsMatcher(credentialsMatcher);
    }

    //    #true表示需要详细的角色信息；false表示不要
    //    shiro.need.role=true
    //    #true表示需要详细的授权信息；false表示不要
    //    shiro.need.permission=true
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo auth = new SimpleAuthorizationInfo();
        LoginUser user = principals.oneByType(LoginUser.class);
        if (isNeedRole) {
            Set<String> roles = roleDao.findRoleByUserName(user.getUserName()).stream().map(Role::getName).collect(Collectors.toSet());
            auth.setRoles(roles);
        }
        if (isNeedPermission) {
            Set<String> permissions = authorityDao.findByUserId(user.getId()).stream().map(Authority::getName).collect(Collectors.toSet());
            auth.setStringPermissions(permissions);
        }
        return auth;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        LoginUser user = userDao.findByUserName(username);
        if (user == null)
            throw new UnknownAccountException(Status.ACCOUNT_NOT_EXISTS.msg());
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), getName());
        // 当验证都通过后，把用户信息放在session里
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("loginuser", user);
        session.setAttribute("userId", user.getId());
        return info;
    }
}
