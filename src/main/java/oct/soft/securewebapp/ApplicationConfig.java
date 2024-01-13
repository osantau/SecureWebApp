package oct.soft.securewebapp;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.faces.annotation.FacesConfig;
import jakarta.security.enterprise.authentication.mechanism.http.CustomFormAuthenticationMechanismDefinition;
import jakarta.security.enterprise.authentication.mechanism.http.LoginToContinue;
import jakarta.security.enterprise.identitystore.DatabaseIdentityStoreDefinition;

/**
 *
 * @author Octavian
 */
@DatabaseIdentityStoreDefinition(
        dataSourceLookup = "jdbc/SecureJsfJpa",
        callerQuery = "SELECT user_password FROM users WHERE username=?",
        groupsQuery = "SELECT user_group FROM users WHERE username=?")

@CustomFormAuthenticationMechanismDefinition(
        loginToContinue = @LoginToContinue(
                loginPage = "/login.xhtml",
                errorPage ="",
                useForwardToLogin = false
        )
)

@FacesConfig
@ApplicationScoped
public class ApplicationConfig {

}
