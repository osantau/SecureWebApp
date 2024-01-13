/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package oct.soft.securewebapp.services;

import java.util.List;
import java.util.Optional;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.security.enterprise.identitystore.Pbkdf2PasswordHash;
import jakarta.transaction.Transactional;
import oct.soft.securewebapp.entities.Quality;
import oct.soft.securewebapp.entities.User;

/**
 *
 * @author Octavian
 */
@ApplicationScoped
public class DataService {

    @PersistenceContext(unitName = "SecureApp")
    EntityManager em;

    @Inject
    Pbkdf2PasswordHash passwordHasher;
    
    @Transactional
    public User createUser(String name, String username, String password, String group) {
        User newUser = new User(name, username,passwordHasher.generate(password.toCharArray()), group);
        em.persist(newUser);
        em.flush();
        return newUser;
    }

    @Transactional
    public Quality createQuality(String description, User user) {
        Quality newQuality = new Quality(description, user);
        em.persist(newQuality);
        em.flush();
        return newQuality;
    }

    public List<User> getAllUsers() {
        return em.createNamedQuery("User.all", User.class).getResultList();
    }

    public Optional<User> getUser(String username) {
        return em.createNamedQuery("User.byUsername", User.class).setParameter("username", username)
                .getResultList().stream().findFirst();
    }

    public List<Quality> getQualities(User user) {
        return em.createNamedQuery("Quality.byUser", Quality.class).setParameter("userId", user.getId())
                .getResultList();
    }
}
